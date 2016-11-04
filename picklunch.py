from datetime import date
import pymysql
import json
import random
import configparser
import requests

config = configparser.ConfigParser()
config.read("qualitylunch.conf")
host = config['database']['host']
user = config['database']['username']
password = config['database']['password']
database = config['database']['database']
room_id = int(config['hipchat-test']['room'])
api_token = config['hipchat-test']['api_token']


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


def pick(lunch_type):
    """
    Pick a place for lunch, having an artificial intellgence to
    1) Not to repeat the same selection in the last 5 days
    2) Favor restaurants that have been more previously

    """
    my_sql = "select SH.name, SH.C, SH.id, SH.avgprice FROM (select R.name, if(H.C is NULL,0,H.C) " \
          "as C, R.id, R.type, R.avgprice, R.active from restaurants R  left join " \
          "(select name, count(*) as C from history as H, restaurants as R WHERE H.visited = R.id group by R.name) " \
          "as H ON R.name = H.name) as SH WHERE SH.id not in (select visited from history " \
          "where date >= DATE_ADD(CURDATE(), INTERVAL - 5 DAY)) AND SH.type = '"\
          + lunch_type + "' AND SH.active = '1' order by SH.C desc;"
    result = run_sql(my_sql)
    pool = 0
    for r in result:
        pool = pool + 1 + int(r[1])
        print(r[0] + " " + str(r[1]) + " " + str(r[2]))

    seed = random.randint(1, pool)
    print("Pool is " + str(pool) + ", seed is " + str(seed) + "\n\r")

    for r in result:
        seed = seed - r[1] - 1
        if seed <= 0:
            return '"' + str(r[2]) + "-" + r[0] + '($' + str(r[3]) + ')"'


def pick_on_day():
    """
    Pick a place for lunch based on days of the week

    """
    my_date = date.today()
    day = my_date.weekday()
    sql = "select name, avgprice from restaurants where type = '" + str(day) + "';"
    result = run_sql(sql)
    for r in result:
        return '"' + r[0] + '($' + str(r[1]) + ')"'


def main():
    """
    Build a message for HipChat poll

    """
    chinese = pick("C")
    japanese = pick("J")
    taiwan = pick("T")
    new_taste = pick("N")
    default = pick_on_day()
    msg = '/poll create for 2 hour "Lunch where?" %s %s %s %s %s "none of the above"' % \
          (chinese, japanese, taiwan, new_taste, default)
    hipchat(msg)


if __name__ == '__main__':
    main()

