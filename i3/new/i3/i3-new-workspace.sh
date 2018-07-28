#!/usr/bin/env bash
export I3SOCK=$(i3 --get-socketpath)
i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))

