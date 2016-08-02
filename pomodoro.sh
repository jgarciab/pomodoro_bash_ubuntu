#!/bin/sh
#
# Pomodoro script for ubuntu.
#
# Javier Garcia-Bernardo
# javiergb.com

one_cycle() { 
	str="="	
	concat="="
	for i in $(seq 25 -1 1); do
	  printf '[%-26s] (%-2s min left)\r' $str $((($i*$1-1)/60+1))
	  str=$str$concat
	  sleep $1
	done
	printf '[%-26s] ( 0 min left)\n\n' $str
 	paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga 
}

notify-send 'Go go go!'
for j in $(seq 1 3); do
	echo "SESION" $j
	one_cycle 60
	notify-send "coffee time?"

	echo "BREAK" $j
	one_cycle 12
	notify-send -t 0 "back to work"	
done

echo "LAST SESSION"
one_cycle 60
notify-send -i face-cool 'End of Pomodoro!'

