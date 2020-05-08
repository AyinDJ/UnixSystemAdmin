import sys
import os

file = sys.argv[1]
deleteWords = sys.argv[2:]
flag = False

file_content = open(file, 'r').read()
os.remove(file)
outFile = open(file, 'w+')

for line in iter(file_content.splitlines()):
	for word in deleteWords:
		if word in line:
			flag = True
	if flag != True:
		outFile.write(line + "\n")
	flag = False
	