#!/usr/bin/env bash

THEME="$HOME/.config/rofi/themes/forest.rasi"

options="Lock\nLog out\nSuspend\nReboot\nShut down"

choice=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme "$THEME" -lines 5)

confirm() {
    answer=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "$1?" -theme "$THEME" -lines 2)
    [ "$answer" = "Yes" ]
}

case "$choice" in
    "Lock")
        ~/.config/i3/lock.sh
        ;;
    "Log out")
        confirm "Log out" && i3-msg exit
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Reboot")
        confirm "Reboot" && systemctl reboot
        ;;
    "Shut down")
        confirm "Shut down" && systemctl poweroff
        ;;
esac
