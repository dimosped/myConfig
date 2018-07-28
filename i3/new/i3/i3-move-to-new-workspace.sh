#!/usr/bin/env bash
export I3SOCK=$(i3 --get-socketpath)
#ls -1 /run/user/$(id -u)/i3/ipc-socket.* | tail -n 1

lastWork=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1)

# Check if the returned output is a number
re='^[0-9]+$'
[[ ! $lastWork =~ $re ]] && { exit 1; }

targetWork=$((${lastWork}+1));

i3-msg "move workspace $targetWork; workspace $targetWork"

