#!/bin/bash

users=($(cat /etc/passwd | awk -F":" '{print $1}'))
uids=($(cat /etc/passwd | awk -F":" '{print $3}'))

for i in "${!users[@]}"; do
	groups=$(cat /etc/group | grep "^${users[i]}" | awk -F":" '{print $4}' | sed 's/,/ /g' )
	echo ${users[i]} ${uids[i]} $groups 
done
