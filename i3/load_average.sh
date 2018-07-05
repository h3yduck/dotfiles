#!/bin/bash

load="$(cut -d ' ' -f1 /proc/loadavg)"
cpus="$(nproc)"

if [ $(echo "$cpus > $load"|bc -l) = 1 ]; then
	echo  $load
else
	echo "<span foreground='#FF0000'>" $load"</span>"
fi

#awk -v cpus=$cpus -v cpuload=$load '
#    BEGIN {
#        if (cpus <= cpuload) {
#            print "#FF0000";
#            exit 33;
#        }
#    }
#'
