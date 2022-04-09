#!/bin/sh

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

if [ "$MUTE" = "true" ]
then
	printf " Muted"
	exit
fi

ICON=""

if [ "$VOL" = 0 ]
then
	ICON=""
elif [ "$VOL" -le 50 ]
then
	ICON=""
else
	ICON=""
fi

printf "%s %s%%" "$ICON" "$VOL"
