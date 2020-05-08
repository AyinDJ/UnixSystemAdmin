import sys
import time

data = {}

def getTimestamp(line):
	return line[:12] 

file = sys.argv[1]
with open(file) as f: 
	for line in f:
		if getTimestamp(line) not in data:
			data[getTimestamp(line)] = { "postfix": 0, "amavis": 0, "timestamp":getTimestamp(line) }
		if "postfix" in line and "reject" in line:
			data[getTimestamp(line)]["postfix"] += 1
		if "amavis" in line and "quarantine" in line:
			data[getTimestamp(line)]["amavis"] += 1

f = open("hourlyInfo.txt", "w+")

for timestamp in sorted(data.keys()):
	if timestamp == "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
		continue
	pr = data[timestamp]["postfix"]
	aq = data[timestamp]["amavis"]
	f.write("{timestamp}  [postfix rejects:{pr}]  [amavis quarantines:{aq}]\n".format(timestamp=timestamp, pr=pr, aq=aq))

f.close()
