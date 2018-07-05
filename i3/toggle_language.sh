#!/bin/bash

lang=$(setxkbmap -query|awk '/layout: /{print $2}')

if [ $lang = "hu" ]; then
	setxkbmap us
else
	setxkbmap hu
fi
pkill -RTMIN+1 i3blocks