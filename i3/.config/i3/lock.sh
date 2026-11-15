#!/usr/bin/env bash
WALL=/home/kai/Pictures/Wallpapers/Wall.jpg
IMG=$HOME/.cache/lockscreen.png

mkdir -p "$HOME/.cache"

# Rebuild the blurred image only if it's missing or the wallpaper is newer
if [ ! -f "$IMG" ] || [ "$WALL" -nt "$IMG" ]; then
    convert "$WALL" -resize 1920x1080^ -gravity center -extent 1920x1080 \
        -blur 0x8 "$IMG" 2>/dev/null
fi

if [ -f "$IMG" ]; then
    i3lock -n -e -f -i "$IMG" -c 1f1a14
else
    i3lock -n -e -f -c 1f1a14
fi
