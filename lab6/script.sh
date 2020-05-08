#!/bin/bash 

ps h -eo pid,etimes,user | sort -k2 -r -n | awk -F" " '$3 != "root" {print $1 ":" $2":"$3}' > p.txt
cat p.txt | awk -F":" '$2 > 120 {system("kill -9 " $1)}'
