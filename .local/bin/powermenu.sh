#!/bin/bash

lock=""
suspend="󰤄"
logout="󰍃"
reboot="󰜉"
shutdown="󰐥"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -i -p -theme-str '
window {
    location:         east;
    anchor:           east;
    x-offset:         -20px;
    y-offset:         0px;
    width:            125px;
    background-color: #00000000;
    border:           0px;
    children:         [ listview ];
}
listview {
    layout:           vertical;
    spacing:          20px;
    lines:            5;
    fixed-height:     true;
    background-color: #00000000;
    border:           0px;
}
element {
    width:            80px;
    padding:          20px 0px; 
    background-color: #0d0d14;
    border:           3px;
    border-color:     #ac3231;
    border-radius:    100%;
}
element selected.normal {
    background-color: #ac3231; 
    text-color:       #0d0d14;
}
element-text {
    font:             "BigBlueTermPlus Nerd Font 48";
    expand:           true;
    vertical-align:   0.5;
    horizontal-align: 0.175;
    margin:           0px 0px 0px -10px;
    background-color: transparent;
    text-color:       inherit;
}
* {
    separatorcolor:   transparent;
    border:           0px;
    outline:          none;
}
' -config ~/.config/rofi/config.rasi)"

case $chosen in
    $shutdown) systemctl poweroff ;;
    $reboot)   systemctl reboot ;;
    $lock)     qs ipc call lockscreen lock ;;
    $suspend)  systemctl suspend ;;
    $logout)   hyprctl dispatch exit ;;
esac