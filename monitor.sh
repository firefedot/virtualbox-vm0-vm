#!/bin/bash

echo Active VM
vm=""
num=`VBoxManage list runningvms | awk '{print $1}' | sed 's\[a-zA-Z,-]\\\g' |  cut -c 2- | rev | cut -c 2- | rev | tail -n 1`

let "wn = num + 1"

echo $wn
