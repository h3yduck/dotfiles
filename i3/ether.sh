#!/bin/bash

ipaddr=`ip a s enp0s31f6 | awk '/inet /{print $2}' | cut -d'/' -f1`

if [ -z $ipaddr ]; then
	echo ""
else
	echo "<span foreground='#C9CCDB'> $ipaddr</span>"
fi
