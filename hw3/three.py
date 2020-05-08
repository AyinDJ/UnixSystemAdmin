import sys
import re
from collections import Counter

data = {"from": {}, "to": {}}

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

file = sys.argv[1]
with open(file) as f: 
	for line in f:
		if getFromEmail(line) in data["from"]:
			data["from"][getFromEmail(line)] += 1
		else:
			data["from"][getFromEmail(line)] = 1
		if getToEmail(line) in data["to"]:
			data["to"][getToEmail(line)] += 1
		else:
			data["to"][getToEmail(line)] = 1

del data["from"]["garbage"]
del data["to"]["garbage"]

fromEmails = Counter(data["from"]).most_common(5)
toEmails = Counter(data["to"]).most_common(5)

for email in fromEmails:
	emailAddress = email[0]
	emailCnt = email[1]
	print("From {emailAddress} {emailCnt}".format(emailAddress=emailAddress, emailCnt=emailCnt))

for email in toEmails:
	emailAddress = email[0]
	emailCnt = email[1]
	print("To {emailAddress} {emailCnt}".format(emailAddress=emailAddress, emailCnt=emailCnt))
