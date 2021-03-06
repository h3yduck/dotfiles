#!/bin/bash

if [ $BLOCK_BUTTON == 4 ]; then
	pactl set-sink-mute 0 0 && pactl set-sink-volume 0 +5%
elif [ $BLOCK_BUTTON == 5 ]; then
	pactl set-sink-mute 0 0 && pactl set-sink-volume 0 -5%
elif [ $BLOCK_BUTTON == 1 ]; then
	pactl set-sink-mute 0 toggle
fi

pavu_status=$(pulseaudio-ctl full-status)
pavu_status=($pavu_status)

volume=${pavu_status[0]}
muted=${pavu_status[1]}

if [ $volume -eq 0 ]; then
	muted="yes"
fi

if [ "$muted" == "yes" ]; then
  echo '<span foreground="#Cd3f45"> Mute</span>'
elif [ $volume -gt 40 ]; then
  echo " $volume"
else
  echo " $volume"
fi
