#!/bin/bash

if [ $BLOCK_BUTTON == 4 ]; then
	xbacklight -inc 20
elif [ $BLOCK_BUTTON == 5 ]; then
	xbacklight -dec 20
fi

brightness=$(xbacklight|cut -d"." -f1)

echo " $brightness"
