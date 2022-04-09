#!/bin/sh

BATTERY="BAT0"
ICON=""

case "$(cat /sys/class/power_supply/$BATTERY/status)" in
	"Charging")
			ICON=" $ICON"
			;;
	esac

CAP=$(cat /sys/class/power_supply/$BATTERY/capacity)

printf "%s  %s%%" "$ICON" "$CAP"
