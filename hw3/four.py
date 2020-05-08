# coding: utf-8
import sys
import re

rejectedCnt = 0
ipSet = set()
fromSet = set()
toSet = set()

def getIp(line):
	ip = re.findall(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', line)
	if len(ip) == 0:
		return 'garbage'
	return ip[0]

def getFromEmail(line):
	fromEmail = re.findall(r'from=<\w+@\w+\.\w+>', line)
	if len(fromEmail) == 0:
		return 'garbage'
	else: 
		fromEmail = fromEmail[0]
	return fromEmail[fromEmail.find('<')+1 : fromEmail.find('>')]
def getToEmail(line):
	toEmail = re.findall(r'to=<\w+@\w+\.\w+>', line)
	if len(toEmail) == 0:
		return 'garbage'
	else: 
		toEmail = toEmail[0]
	return toEmail[toEmail.find('<')+1 : toEmail.find('>')]

with open("log4", "r") as f: 
	for line in f:
		if "reject" in line and "dnsbl.sorbs.ne" in line:
			rejectedCnt += 1
		ipSet.add(getIp(line))
		fromSet.add(getFromEmail(line))
		toSet.add(getToEmail(line))

ipSet.remove('garbage')
fromSet.remove('garbage')
toSet.remove('garbage')

uniqueIps = len(ipSet)
fromAddr = len(fromSet)
toAddr = len(toSet)

print("{rejectedCnt} messages rejected".format(rejectedCnt=rejectedCnt))
print("{uniqueIps} unique IP’s".format(uniqueIps=uniqueIps)) 
print("{fromAddr} unique from addresses".format(fromAddr=fromAddr))
print("{toAddr} unique to address".format(toAddr=toAddr))
