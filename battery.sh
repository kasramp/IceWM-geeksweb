#!/bin/bash
#upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
password=$1
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage")
set -- $percentage
value=$2
value=${value%\%*}
value=${value%.*}
if [ $value -le 10 ]
then
vars=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|percentage")
set -- $vars
#echo $vars
zenity --warning --title="Low Power" --text=$1" "$2"\nremaining: "$6" mins\n"$8" "$9 --display=:0.0
fi
if [ $value -le 5 ]
then
exec gnome-screensaver-command -l &
echo $password | sudo -S pm-suspend
fi
