#!/bin/bash

NETWORK_ID=$(ip route | grep default | grep -Po 'dev +\w+ ' | awk '{print $2}')

# gets default ip 
GATEWAY=$(ip route | grep default | grep -Po '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b')

# gets mask in decimal  
MASK=$(ip route | grep $NETWORK_ID | tail -n 1 | grep -Po '(?<=/)\d{1,2}')
# stack overflow 
set -- $(( 5 - ($MASK / 8) )) 255 255 255 255 $(( (255 << (8 - ($MASK % 8))) & 255 )) 0 0 0
[ $1 -gt 1 ] && shift $1 || shift
MASK="${1-0}.${2-0}.${3-0}.${4-0}"

# device
DEVICE=$(ip route | grep default | grep -Po 'dev +\w+ ' | awk '{print $2}')

echo "gateway: $GATEWAY netmask: $MASK device: $DEVICE" 