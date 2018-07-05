#!/bin/bash

ipaddr=$(ip a s tun0 | awk '/inet /{print $2}' | cut -d'/' -f1)

if [ $BLOCK_BUTTON -eq 1 ]; then
	if [ -z $ipaddr ]; then
		sudo systemctl start openvpn@balabit
	else
		sudo systemctl stop openvpn@balabit
	fi		
fi

ipaddr=$(ip a s tun0 | awk '/inet /{print $2}' | cut -d'/' -f1)
service_state=$(systemctl show openvpn@balabit -p ActiveState|cut -d'=' -f2)

if [ -z $ipaddr ]; then
	if [ $service_state = "active" ]; then
		echo "<span foreground='#c9e600'> Connecting</span>"
	else
		echo ""
	fi
else
	echo "<span foreground='#2ebd59'> $ipaddr</span>"
fi
