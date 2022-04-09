#!/bin/sh

WIFI_ICON=""
STATS_ICON=""

COLOR_GREEN="^c#078c2d^"
COLOR_RED="^c#9c0819^"

[ "$(cat /sys/class/net/wlp2s0/operstate)" = 'down' ] && wifi_stats="down"

if [ "$wifi_stats" = "down" ]
then
    color=$COLOR_RED 
else
    color=$COLOR_GREEN
fi

printf "%s %s%s^d^" "$WIFI_ICON" "$color" "$STATS_ICON"
