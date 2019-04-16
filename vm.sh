#!/bin/bash
#
# two script
list="/home/netfilter/VBoxHardenedLoader-5.18/Binary/data/vm.list"
for i in `ls ~/VirtualBox\ VMs/ | sort`
do
    if ! grep $i $list
    then
        echo "Нет в списке машин"
        echo "Внесение в список:"
        echo "| "$i" | + | active |" >> $list
    else
        echo "Машина "$i" уже есть в списке"
    fi
done
