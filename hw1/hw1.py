import sys

files = sys.argv[1:]
for file in files:
	contents = open(file, 'r').read()
	print(contents)