#!/bin/sh

ICON=""
MEM_USAGE=$(free -h | awk '/^Mem/ { print $3"/"$2 }' | sed s/i//g)
printf "%s %s" "$ICON" "$MEM_USAGE"
