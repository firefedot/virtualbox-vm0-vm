#!/bin/bash

ip="91.221.70.184"
num=`VBoxManage list vms | awk '{print $1}' | sed 's\[a-zA-Z,-]\\\g' |  cut -c 2- | rev | cut -c 2- | rev | tail -n 1`

let "wn = num + 1"
nameVM="win-"$wn
let "port = 9000 + wn"
ram=4096
hdd=$(shuf -n 1 hdd.list)
echo "Create new VM:"

VBoxManage createvm --name "$nameVM" --register

VBoxManage modifyvm "$nameVM" \
--ostype Windows7_64 \
--cpus 2 \
--memory $ram \
--vram 64 \
--acpi on \
--ioapic on \
--paravirtprovider legacy \
--cpuexecutioncap 75 \
--nic1 nat \
--nictype1 82540EM \
--cableconnected1 on \
--boot1 dvd

VBoxManage createhd --filename $HOME/VirtualBox\ VMs/$nameVM/"$nameVM".vdi --size $hdd
VBoxManage storagectl $nameVM --name SATA --add sata
VBoxManage storageattach $nameVM \
--storagectl SATA \
--port 0 \
--type hdd \
--medium $HOME/VirtualBox\ VMs/$nameVM/"$nameVM".vdi

VBoxManage storagectl $nameVM --name IDE --add ide
VBoxManage storageattach $nameVM \
--storagectl IDE \
--port 1 \
--device 0 \
--type dvddrive \
--medium $HOME/iso/Windows\ 7\ SP1\ x86-x64\ by\ g0dl1ke\ 17.3.15.iso

vboxmanage modifyvm $nameVM --vrde on
vboxmanage modifyvm $nameVM --vrdeaddress $ip
vboxmanage modifyvm $nameVM --vrdeport $port
vboxmanage modifyvm $nameVM --vrdeproperty VNCPassword="123123"

bash hidevm_ahci_vm.sh $nameVM
