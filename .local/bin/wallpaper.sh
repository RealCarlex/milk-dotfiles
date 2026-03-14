#!/bin/bash

wall_dir="$HOME/Pictures/Wallpapers"

options=""
while IFS= read -r wall; do
    if [ -n "$options" ]; then
        options+="\n"
    fi
    options+="${wall}\x00icon\x1f${wall_dir}/${wall}"
done < <(ls "$wall_dir" | grep -E ".jpg$|.jpeg$|.png$|.webp$|.gif$")

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Wallpaper" -theme-str '
* {
    border:           0px;
    outline:          none;
    separatorcolor:   transparent;
}
window {
    location:         south;
    anchor:           south;
    y-offset:         -20px;
    width:            837px;      
    background-color: #0d0d14;
    border:           3px;
    border-color:     #ac3231;
    border-radius:    15px;
    children:         [ listview ];
}
listview {
    layout:           horizontal;
    spacing:          20px;
    padding:          20px;
    lines:            4;
    fixed-columns:    true;
    background-color: transparent;
}
element {
    width:            180px;      
    height:           100px;      
    padding:          2px 0px;    
    background-color: #151521;
    border-radius:    8px;
}
element selected.normal {
    background-color: #ac3231;
}
element-icon {
    size:             160px;      
    expand:           true;       
    horizontal-align: 0.5;
    vertical-align:   0.5;
    background-color: transparent;
}
element-text {
    enabled:          false;
}
' -config ~/.config/rofi/config.rasi)

if [ -n "$chosen" ]; then
    swww img "$wall_dir/$chosen" --transition-type center --transition-fps 144 --transition-duration 2
fi
