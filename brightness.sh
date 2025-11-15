#!/bin/bash
# brightness.sh — Adjust brightness with on-screen notification

get_brightness() {
    brightnessctl get
}

get_max() {
    brightnessctl max
}

case $1 in
  up)
    brightnessctl set +10%
    ;;
  down)
    brightnessctl set 10%-
    ;;
esac

cur=$(get_brightness)
max=$(get_max)
percent=$(( 100 * cur / max ))

# Display notification
notify-send -t 800 "💡 Brightness: ${percent}%"

