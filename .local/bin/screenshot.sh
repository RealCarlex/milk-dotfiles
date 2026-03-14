#!/usr/bin/env bash

if ! command -v wl-copy &> /dev/null; then
    notify-send "Error" "wl-clipboard isn't installed."
    exit 1
fi

NOW=$(date +%d-%m-%Y_%H-%M-%S)
FILE_PATH="$HOME/Pictures/Screenshots/${NOW}.png"

area=$(slurp -b 121318c0 -c b2c5ff)

if [ -z "$area" ]; then
    exit 0
fi

grim -g "$area" - | tee "$FILE_PATH" | wl-copy

notify-send "Screenshot Taken" "Screenshot: ${NOW}.png taken and copied to clipboard."
