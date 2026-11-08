#!/usr/bin/env bash
IMG=/tmp/lockscreen.png

if import -window root "$IMG" 2>/dev/null && convert "$IMG" -blur 0x8 -fill '#1f1a14' -colorize 40% "$IMG" 2>/dev/null; then
    i3lock -n -e -f -i "$IMG" -c 1f1a14
else
    i3lock -n -e -f -c 1f1a14
fi
