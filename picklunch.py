from datetime import date
import pymysql
import json
import random
import configparser
import requests

config = configparser.ConfigParser()
config.read("/home/eclipse/qualitylunch/qualitylunch.conf")
host = config['database']['host']
user = config['database']['username']
password = config['database']['password']
database = config['database']['database']
room_id = int(config['hipchat-prod']['room'])
api_token = config['hipchat-prod']['api_token']


def run_sql(query):
    """
    Run SQL on a pre-defined database

    """
    conn = pymysql.connect(host=host, port=3306, user=user, passwd=password, db=database, charset='utf8')
    cur = conn.cursor()
    cur.execute(query)
    conn.close()
    return cur


def hipchat(message):
    """
    Send a HipChat message to a pre-defined room

    """
    room = 'https://api.hipchat.com/v2/room/%d/notification' % room_id
    headers = {'Authorization': 'Bearer %s' % api_token, 'Content-type': 'application/json'}
    requests.post(url=room, data=json.dumps({'message': message, 'color': 'gray'}), headers=headers)


def algo_select(restaurants):
    """
    Pick a place for lunch, having an artificial intelligence to
    1) Not to repeat the same selection in the last 5 days
    2) Favor restaurants that have been more previously

    """
    pool = restaurants.rowcount
    seed = random.randint(1, pool)
    print("Pool is %s, seed is %s\n\r" % (str(pool), str(seed)))
    for n in list(restaurants.fetchall()):
        seed = seed - n[1] - 1
        if seed <= 0:
            msg = '"%s-%s($%s)"' % (str(n[2]), str(n[0]), str(n[3]))
            return msg


def pick(lunch_type):
    """
    Query database for a list of restaurants and pass to the algo for processing

    """
    my_sql = "select SH.name, SH.C, SH.id, SH.avgprice FROM (select R.name, if(H.C is NULL,0,H.C) " \
             "as C, R.id, R.type, R.avgprice, R.active from restaurants R  left join " \
             "(select name, count(*) as C from history as H, restaurants as R WHERE H.visited = R.id " \
             "group by R.name) as H ON R.name = H.name) as SH WHERE SH.id not in (select visited from history " \
             "where date >= DATE_ADD(CURDATE(), INTERVAL - 5 DAY)) AND SH.type = '"\
             + lunch_type + "' AND SH.active = '1' order by SH.C desc;"
    restaurants = run_sql(my_sql)
    return algo_select(restaurants)


def main():
    """
    Build a message for HipChat poll

    """
    chinese = pick("C")
    japanese = pick("J")
    asian = pick("A")
    western = pick("W")
    msg = '/poll create for 2 hour "Lunch where?" %s %s %s %s "none of the above"' % \
          (chinese, japanese, asian, western)
    hipchat(msg)


if __name__ == '__main__':
    main()

