#!/bin/sh

BLUETOOTH_ICON=""
STATS_ICON=""

COLOR_GREEN="^c#078c2d^"
COLOR_RED="^c#9c0819^"

powered=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [ "$powered" = "yes" ]
then
    color=$COLOR_GREEN
else
    color=$COLOR_RED
fi

printf "%s %s%s^d^" "$BLUETOOTH_ICON" "$color" "$STATS_ICON"
