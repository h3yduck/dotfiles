#!/bin/bash

ipaddr=`ip a s wlp3s0 | awk '/inet /{print $2}' | cut -d'/' -f1`

if [ -z $ipaddr ]; then
	echo ""
else
	echo "<span foreground='#C9CCDB'> $ipaddr</span>"
fi
