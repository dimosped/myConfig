#!/usr/bin/env bash

i3status -c ~/.i3/i3status.conf | while :
do
	read line
	mystuff=$(/home/dimos/.i3/i3-nettput.sh)
	fanRpm=$(cat /sys/devices/platform/thinkpad_hwmon/fan1_input)
	mystuff="[{ \"name\":\"Net activity:\",\"color\":\"00FF00\",\"full_text\": \"${mystuff} \" },{ \"name\":\"Fan:\",\"full_text\": \" ${fanRpm} rpm \" },"
	echo "${line/[/${mystuff}}" || exit 1
done

