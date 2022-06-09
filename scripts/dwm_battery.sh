#!/bin/sh

BATTERY="BAT0"
ICON=""
CAP=$(cat /sys/class/power_supply/$BATTERY/capacity)

if [ "$CAP" -lt 25 ];
then
    ICON=""
elif [ "$CAP" -lt 50 ];
then
    ICON=""
elif [ "$CAP" -lt 90 ];
then
    ICON=""
else
    ICON=""
fi

case "$(cat /sys/class/power_supply/$BATTERY/status)" in
	"Charging")
			ICON=" $ICON"
			;;
	esac

printf "%s  %s%%" "$ICON" "$CAP"
