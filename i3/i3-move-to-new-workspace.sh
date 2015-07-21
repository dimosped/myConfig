#!/usr/bin/env bash

#[ "$1" != "next" -a "$1" != "prev" ] && { exit 1; }

#currWork=$(i3-msg -t get_workspaces | sed 's/\"num\"/\n\"num\"/g' | grep '"focused":true' | cut -d',' -f 1 | cut -d':' -f 2)
lastWork=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1)
#firstWork=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | tail -1)

# Check if the returned output is a number
re='^[0-9]+$'
#[[ ! $currWork =~ $re ]] && { exit 1; }
[[ ! $lastWork =~ $re ]] && { exit 1; }
#[[ ! $firstWork =~ $re ]] && { exit 1; }

targetWork=$((${lastWork}+1));

#if [ "$1" == "next" ]; then
#	if [[ "$currWork" ==  "$lastWork" ]]; then
#		targetWork=$firstWork
#	else
#		targetWork=$((${currWork}+1));
#	fi
#else	
#	if [[ "$currWork" ==  "$firstWork" ]]; then
#		targetWork=$lastWork
#	else
#		targetWork=$((${currWork}-1));
#	fi
#fi

#echo $currWork
#echo $firstWork
#echo $lastWork
#echo $targetWork

i3-msg "move workspace $targetWork; workspace $targetWork"

