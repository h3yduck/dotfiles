#!/bin/bash

lang=$(setxkbmap -query|awk '/layout: /{print $2}')

if [ $BLOCK_BUTTON -eq 1 ]; then
	if [ $lang = "hu" ]; then
		setxkbmap us
		echo us
	else
		setxkbmap hu
		echo hu
	fi
else
	echo $(setxkbmap -query|awk '/layout: /{print $2}')
fi