#!/bin/bash

BG="#0d0d14"
FG="#ffffff"
RED="#ac3231"

FULL_LIST=$(cliphist list)

SELECTION=$(echo "$FULL_LIST" | cut -f2- | rofi -dmenu -i -p "󰅌 Clipboard" -theme-str "
* {
    border:           0;
    margin:           0;
    padding:          0;
}
window {
    width:            600px;
    background-color: $BG;
    border:           3px;
    border-color:     $RED;
    border-radius:    15px;
}
mainbox {
    children:         [ inputbar, listview ];
    background-color: transparent;
}
inputbar {
    enabled:          true;
    padding:          15px 15px 5px 15px;
    background-color: transparent;
    children:         [ prompt, entry ];
}
prompt {
    text-color:       $RED;
    font:             \"BigBlueTermPlus Nerd Font 14\";
    padding:          0px 10px 0px 0px;
}
entry {
    text-color:       $FG;
    font:             \"BigBlueTermPlus Nerd Font 12\";
    placeholder:      \"\";
}
listview {
    lines:            10;
    padding:          10px 15px 15px 15px;
    scrollbar:        false;
    spacing:          5px;
}
element {
    padding:          8px;
    border-radius:    8px;
    background-color: transparent;
}
element selected {
    background-color: $RED;
    text-color:       $FG;
}
element-text {
    font:             \"BigBlueTermPlus Nerd Font 10\";
    text-color:       inherit;
}
")

if [ ! -z "$SELECTION" ]; then
    ID=$(echo "$FULL_LIST" | grep -F "$SELECTION" | head -n 1 | cut -f1)
    
    echo "$ID" | tr -d '\n' | cliphist decode | wl-copy
    notify-send "Clipboard" "Copied to clipboard!" -i edit-copy
fi