#!/bin/bash 

# dd
# Description: 
# You can use dd to copy and convert files from one place to another.
# Example 1
# Backs up an entire copy of a hard disk to another hard disk connected to the same system
# in this example the UNIX device name of the source hard disk is /dev/hda, and device name of the target hard disk is /dev/hdb
echo dd if = /dev/sda of = /dev/sdb

# find
# Description: 
# Command used  to search for a file or directory on your file system.
# Example 1 
# Finds all regular files in /home that are not owned by root and changes their permissions to ensure they have 755 permissions.
echo find /home -type f \! -user root -exec chmod 755 {} \;

# file 
# Description:
# Determines the file type of a file. It reports the file type in human readable format.
# Example 1
# tells you the type of the files are in the compressed file without decompressing
#could be used as an extra security measure to make sure there are no unexpected files in the compressed tarball
echo file -z download.tar.gz

# fuser
# Description:
# Command used to determine which process is using a file, a directory or a socket.
# Example 1 
# Command below looks up processes using TCP and UDP sockets.
# -n is used to select corresponding namespace -v is for verbose 
echo fuser -v -n tcp 80

#grep 
# Description: 
# Command used to search text. It searches the file for lines containing a match to the given strings or words.
# Example 1
# Searches /etc/passwd for a user named erive001. The -i means that letter casing is ignored. 
echo grep -i "erive001" /etc/passwd

#host 
# Description:
# Utility for performing DNS lookups. Normally used to convert names to IP addresses and vice versa.
# Example 1
# Performs a reverse lookup on the IP address 204.228.150.3
echo host 204.228.150.3

#ldd 
# Description:
# Command that prints shared object dependencies given an option and a command.
# Example 1
# ldd prints and perform relocations and report any missing objects.
# then we pipe to grep and wc to print the total number of objects not found. 
echo "ldd -d /bin/cp | grep \"not found\" | wc -l"

#lsof 
# Description:
# Command that means "list open files". Used to report a list of all open files and the processes that opened them.
# Example 1
# Prints list of all opened files by user erive011 and pipes to grep to see if user opened crond files
echo "lsof -u erive011 | grep \"crond\""

#mount 
# Description:
# Command that serves to attach the filesystem found on some device to the file tree.
# Example 1
# Mounts device foo at given directory /src
echo "mount /dev/app /src"

#ps 
# Description:
# Reports a snapshot of the current processes.Allows you to view a process info and exact commands. 
# Example 1
# Print the cpu usage and pid of all running processes, sort by cpu usage (where the minus means the highest usage is at the top), and print the first two lines
# then, we only want the second line, so pipe to tail
# now we print the CPU usage, and pid of the process using most cpu
# kill the process
echo "ps -eo %cpu,pid --sort -%cpu | head -n 2 | tail -n 1 | awk '{print $2}' | xargs kill"

#pkill 
# Description:
# Command used to kill a process without having to specify PIDs
# Example 1
# Kills the single process ping google.com 
echo "pkill -f \"ping google.com\""

#netstat 
# Description: 
# Utility that displays network connections for the Transmission Control Protocol, routing tables, and several network interface and network protocol
# Example 1
# netstat command to show only the connections that are using a specific PID, 28604. -l shows only listening sockets 
echo "netstat -l | findstr 28604"

#renice 
# Description:
# Changes priority of running processes.
# Example 1
# Changes the priority of process ID’s 987 and 32, and all processes owned by users daemon and root.
echo "renice +1 987 -u daemon root -p 32"

#rsync 
# Description:
# command for copying and synchronizing files and directories remotely as well as locally 
# Example 1
# Syncs Directory form local server to remote server.
echo "rsync -avzh public_html/ root@10.11.12.13:/home/"


#time 
# Description:
# Command used to determine how long a given command takes to run
# Useful in determining performance of scripts or commands.
# Example 1
# Saves a record of the time command information in a file called output.time.txt.
echo "time date 2> output.time.txt"


#ssh 
# Description:
# Command that provides a secure encrypted connection between two hosts over an insecure network. 
# Can also be used for terminal access, file transfers, and for tunneling other applications.
# Example 1
# Connects to a remot server at port 22.  Prints debugging information with -v flag.
echo "ssh -v -p 22 emma@138.68.242.25"

#stat 
# Description:
# Utility for viewing file or file system status. 
# It retrieves information such as file type; access rights; time of file birth, last access, last data modification, last status change and more. 
# Example 1
# Checks the file status of cron located at /var/log/cron
echo "stat /var/log/cron" 

#strace 
# Description:
# Command used to trace system calls and signals.
# Example 1
# Stores the strace output to output.txt file for future referance. 
echo "strace -o output.txt ls"

#uname 
# Description:
# Prints given system information.
# Example 1
# Prints the kernel name and version number/release 
echo "uname -rs"  

#wget 
# Description: 
# Used to download files from the web at the command line. Can run in background.
# Example 1
# Gets zip file to download repo forge RPM manager
echo "wget http://repository.it4i.cz/mirrors/repoforge/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm"
