#!/bin/bash

rofi_command="rofi 
-xoffset 0
-yoffset 0
-location 1
-no-fullscreen
"
# Options
shutdown="Shutdown"
reboot="Reboot"
suspend="Suspend"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
esac

