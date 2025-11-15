#!/bin/bash
# Simple volume notification script

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1
}

get_mute() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(yes|no)'
}

case $1 in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

vol=$(get_volume)
mute=$(get_mute)

if [ "$mute" = "yes" ]; then
    notify-send -t 800 "🔇 Volume muted"
else
    notify-send -t 800 "🔊 Volume: ${vol}%"
fi

