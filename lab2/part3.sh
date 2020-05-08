#!/bin/bash 
FILEPATH="/Users/emmarivera/testfile.txt"

if [ -f $FILEPATH ]; then
	#file exists
	echo $(date +"%m-%d-%Y %T") "- File" "\"${FILEPATH}\"" "has been found" >> /var/log/cs183/uptime.log
else 
	#file doesn't exist
	echo $(date +"%m-%d-%Y %T") "- File" "\"${FILEPATH}\"" "has been lost" >> /var/log/cs183/uptime.log
fi 
