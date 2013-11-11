#!/bin/bash
#upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage")
set -- $percentage
value=$2
value=${value%.*}
if [ $value -le 10 ]
then
vars=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|percentage")
set -- $vars
#echo $vars
zenity --warning --title="Low Power" --text=$1" "$2"\nremaining: "$6" mins\n"$8" "$9
fi
