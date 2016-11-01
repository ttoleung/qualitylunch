#!/usr/bin/python

from datetime import datetime
from urllib2 import Request, urlopen
from datetime import date
import calendar
import urllib2
import MySQLdb as mdb
import sys
import json
import random

def sql_insert(sql_list, database):
	con = mdb.connect('localhost', 'eclipse', 'eclipse', 'qualitylunch')
	cur = con.cursor()
	for sql in sql_list:
		try:
			cur.execute(sql)
			print 'Inserted for ' + sql[97:107]
		except mdb.IntegrityError:
			con.rollback()
			print 'key date already existed for ' + sql[97:107]
	con.close()

def run_sql(query):
	con = mdb.connect('localhost', 'eclipse', 'eclipse', 'qualitylunch', charset='utf8');
	cur = con.cursor()
	cur.execute(query)
	rows = cur.fetchall()
	con.close()
	return rows

def hipchat_room(message):
	api_token = 'yqf47hQXMmIhV4IAPvLsyyHtLdTWK4vaMC1uhxYD'
	room_id = 1890654
	test = True
	color = 'gray'
	if test:
		api_token = 'E6g0kqULXAoRLz5MPc6Tk7tpPLAWJ4qrklEIpKEF'
		room_id = 1704479

	url = 'https://api.hipchat.com/v2/room/%d/notification' % room_id
	headers = {
		"content-type": "application/json",
		"authorization": "Bearer %s" % api_token}
	datastr = json.dumps({
		'message': message,
		'color': color,
		'message_format': 'html',
		'notify': True})
	request = Request(url, headers=headers, data=datastr)
	uo = urlopen(request)
	rawresponse = ''.join(uo)
	uo.close()
	assert uo.code == 204
	print "Hipchat message sent"

def pick(type):
	sql = "select SH.name, SH.C, SH.id, SH.avgprice FROM (select R.name, if(H.C is NULL,0,H.C) as C, R.id, R.type, R.avgprice, R.active from restaurants R  left join (select name, count(*) as C from history as H, restaurants as R WHERE H.visited = R.id group by R.name) as H ON R.name = H.name) as SH WHERE SH.id not in (select visited from history where date >= DATE_ADD(CURDATE(), INTERVAL - 5 DAY)) AND SH.type = '" + type + "' AND SH.active = '1' order by SH.C desc;"
	result = run_sql(sql)
	pool = 0
	for r in result:
		pool = pool + 1 + int(r[1])
		print r[0].encode("utf-8") + " " + str(r[1]) + " " + str(r[2])
	seed = random.randint(1,pool)
	print "Pool is " + str(pool) + ", seed is " + str(seed) + "\n\r"

	for r in result:
		seed = seed - r[1] - 1
		if seed <= 0:
			return '"' + str(r[2]) + "-" + r[0].encode("utf-8") + '($' + str(r[3]) + ')"'

def pick_on_day():
	my_date = date.today()
	day = my_date.weekday()
	sql = "select name, avgprice from restaurants where type = '" + str(day) + "';"
	result = run_sql(sql)
	for r in result:
		return '"' + r[0].encode("utf-8") + '($' + str(r[1]) + ')"'
	

def main():
	msg = '/poll create for 2 hour "Lunch where?"' + ' ' + pick("C") + ' ' + pick("J") + ' ' + pick("T") + ' ' + pick("N") + ' ' +  pick_on_day() + ' "none of the above"'
	hipchat_room(msg)

if __name__ == '__main__':
	main()

