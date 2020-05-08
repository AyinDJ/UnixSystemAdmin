#!/bin/bash

#addresses: 4 usable: 2 netmask: 255.255.255.252
# arg is located at $1

ADDR=$((2**(32 - $1)))
USABLE=$(($ADDR - 2))

set -- $(( 5 - ($1 / 8) )) 255 255 255 255 $(( (255 << (8 - ($1 % 8))) & 255 )) 0 0 0
[ $1 -gt 1 ] && shift $1 || shift
MASK="${1-0}.${2-0}.${3-0}.${4-0}"

echo "addresses: $ADDR usable: $USABLE  netmask: $MASK"