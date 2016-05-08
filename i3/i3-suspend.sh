#!/usr/bin/env bash

#i3lock -c 000000
#dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend

/home/dimos/.i3/i3-lock.sh

systemctl suspend

