#!/bin/bash

BG="#0d0d14"
FG="#ffffff"
RED="#ac3231"

TEXT="─── WINDOW MANAGEMENT ──────────         ─── NODES / WINDOWS ────────────
Close Window      : Super + X            Toggle Floating : Super + V
Fullscreen        : Super + F            Toggle Split    : Super + J
Pseudo Tiled      : Super + T            Move Window     : Super + Shift + HJKL/Arrows
Move Focus        : Super + HJKL/Arrows  Resize Window   : Super + Alt + HJKL/Arrows

─── SYSTEM & UTILS ──────────────        ─── APPS ───────────────────────
App Launcher      : Super + Space        Terminal        : Super + Return
Clipboard Menu    : Super + C            File Manager    : Super + E
Power Profiles    : Super + P            Browser         : Super + B
Screenshot (Area) : Super + S            Power Menu      : Super + Escape
Screenshot (Full) : Print                Lutris          : Super + G

─── WORKSPACES ──────────────────        ─── MEDIA & AUDIO ──────────────
Switch Workspace  : Super + 1-5          Mute Audio      : XF86AudioMute
Move to Workspace : Super + Shift + 1-5  Volume Up/Down  : XF86AudioRaise/Lower
Scroll Workspace  : Super + MouseScroll  Brightness      : XF86MonBrightnessUp/Down

─── POWER ──────────────────────────────────────────────────────────
Power Menu: Super + Esc                  Lock Screen     : Super + Ctrl + Q
Lock: Super + Ctrl + Q
Power Profiles: Super + P"

echo -e "$TEXT" | rofi -dmenu -i -p "Help" -theme-str "
window {
    width:            1150px;
    background-color: $BG;
    border:           3px;
    border-color:     $RED;
    border-radius:    15px;
}
mainbox {
    children:         [ listview ];
    background-color: transparent;
}
listview {
    padding:          40px;
    background-color: transparent;
    lines:            22;
    fixed-height:     true;
    border:           0px;
    scrollbar:        false;
    spacing:          0px;
}
element {
    padding:          0px;
    background-color: transparent;
    text-color:       $FG;
}
element-text {
    font:             \"BigBlueTermPlus Nerd Font 12\";
    text-color:       inherit;
}
element selected {
    background-color: transparent;
    text-color:       $FG;
}

inputbar { enabled: false; }
message { enabled: false; }
separator { enabled: false; }
* {
    separator-style:  none;
    border-color:     transparent;
}
"
