#!/bin/bash

#kdump because it fails after booting
chkconfig kdump off
service kdump stop 

#sshd not needed because we wont need to gain access through ssh
# we wont need to log into a remote machine and access its commands or 
# transfer data log
chkconfig sshd off
service sshd stop