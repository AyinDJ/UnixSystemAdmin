# coding: utf-8
import sys
import re

data = {"total": { "known": 0, "unknown": 0}, "known": {}, "unknown": {} }

def getIp(line):
	return re.findall(r'\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]', line)[0]

with open("log2", "r") as f: 
	for line in f:
		if "postfix" in line and "connect" in line:
			if "unknown" in line:
				data["total"]["unknown"] += 1
				if getIp(line) in data["unknown"]:
					data["unknown"][getIp(line)] += 1
				else: 
					data["unknown"][getIp(line)] = 1
			else:
				data["total"]["known"] += 1
				if getIp(line) in data["known"]:
					data["known"][getIp(line)] += 1
				else: 
					data["known"][getIp(line)] = 1

maxKnownIp = max(data["known"], key=data["known"].get)
maxKnownConnect = max(data["known"].values())
maxUnknownIp = max(data["unknown"], key=data["unknown"].get)
maxUnknownConnect = max(data["unknown"].values())

totalKnown = data["total"]["known"]
totalUnknown = data["total"]["unknown"]

print("Total Known connection: {totalKnown} – {maxKnownIp} accounts for {maxKnownConnect} connections".format(totalKnown=totalKnown, maxKnownIp=maxKnownIp, maxKnownConnect=maxKnownConnect))
print("Total Unknown connections {totalUnknown} – {maxUnknownIp} accounts for {maxUnknownConnect} connections".format(totalUnknown=totalUnknown, maxUnknownIp=maxUnknownIp, maxUnknownConnect=maxUnknownConnect))
