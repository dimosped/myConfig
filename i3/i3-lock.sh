#!/usr/bin/env bash

#xautolock -detectsleep -time 300 -locker "i3lock -d -c 000000" 
xset s off
xset dpms 0 500 0

# This version will auto lock the laptop when it wakes up from suspend after 300 or more seconds.
i3lock -i /home/dimos/Pictures/i3lock/santoriniB.png -c 000000

#if [ "$1" == "off" ]; then 
#	sleep 1200
#	pgrep i3lock && xset dpms force off
#fi

exit 0
