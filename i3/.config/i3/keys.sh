#!/usr/bin/env bash
THEME="$HOME/.config/rofi/themes/forest.rasi"

grep -E '^bindsym' ~/.config/i3/config \
  | sed -E 's/^bindsym +//; s/--no-startup-id //; s/\$mod/Super/g; s/ exec / /' \
  | awk '{k=$1; $1=""; sub(/^ /,""); printf "%-24s %s\n", k, $0}' \
  | rofi -dmenu -i -p "Keys" -theme "$THEME" \
      -theme-str 'window { location: east; anchor: east; x-offset: -12px; width: 38%; border: 2px; border-radius: 8px; }
                  listview { lines: 22; fixed-height: true; }'
