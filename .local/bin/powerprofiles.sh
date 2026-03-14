#!/bin/bash

BG="#0d0d14"
FG="#ffffff"
RED="#ac3231"

OPTIONS="󰓅 Performance\n󰾆 Balanced\n󰾆 Power Saver"
TITLE="󱐋 Select Power Profile"

SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -i -mesg "$TITLE" -theme-str "
* {
    border:           0;
    margin:           0;
    padding:          0;
    spacing:          0;
}
window {
    width:            450px;
    background-color: $BG;
    border:           3px;
    border-color:     $RED;
    border-radius:    15px;
}
mainbox {
    children:         [ message, listview ];
    background-color: transparent;
}
message {
    padding:          20px 0px 10px 0px;
    background-color: transparent;
    border:           0px;
    border-color:     transparent;
}
textbox {
    text-color:       $RED;
    font:             \"BigBlueTermPlus Nerd Font 14\";
    horizontal-align: 0.5;
    background-color: transparent;
}
listview {
    lines:            3;
    padding:          30px 20px 20px 20px;
    fixed-height:     true;
    scrollbar:        false;
    spacing:          10px;
    background-color: transparent;
    border:           0px;
}
element {
    padding:          10px;
    border-radius:    8px;
    background-color: transparent;
    text-color:       $FG;
}
element selected {
    background-color: $RED;
    text-color:       $FG;
}
element-text {
    font:             \"BigBlueTermPlus Nerd Font 12\";
    background-color: transparent;
    text-color:       inherit;
}
inputbar { enabled: false; }
")

case $SELECTION in
    *Performance)
        powerprofilesctl set performance
        notify-send "Power Profile Changed" "Profile: Performance"
        ;;
    *Balanced)
        powerprofilesctl set balanced
        notify-send "Power Profile Changed" "Profile: Balanced"
        ;;
    *"Power Saver")
        powerprofilesctl set power-saver
        notify-send "Power Profile Changed" "Profile: Power Saver"
        ;;
esac