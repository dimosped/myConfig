#!/usr/bin/env bash

i3status -c ~/.i3/i3status.conf | while :
do
	read line
	mystuff=$(/home/dimos/.i3/i3-nettput.sh)
	cpuutil=$(cat /home/dimos/.i3/cpuutil.log)
	mpstat -P ALL 1 1 | grep Average | grep -v CPU | awk 'BEGIN{count=0; mystr=""}{currVal=100-int($12);if(count == 0)currVal="["currVal"]";mystr=mystr" "currVal;count+=1}END{print mystr}'  > /home/dimos/.i3/cpuutil.log
	fanRpm=$(cat /sys/devices/platform/thinkpad_hwmon/fan1_input)
	memory=$(free -h | grep Mem | awk '{print "Memory: "$3" "$4" "$7 }')
	mystuff="[{ \"name\":\"Net activity:\",\"color\":\"00FF00\",\"full_text\": \"${mystuff} \" },{ \"name\":\"Memory\",\"full_text\": \" ${memory} \" },{ \"name\":\"CPU util:\",\"full_text\": \" CPU load:${cpuutil} \" },{ \"name\":\" Fan:\",\"full_text\": \" Fan: ${fanRpm} rpm \" },"
	echo "${line/[/${mystuff}}" || exit 1
done

