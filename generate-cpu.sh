#/bin/bash

file="p4-2800"
clearfile="p4-2800.txt"
genfile="$file.cfg"
echo -n > $genfile
text='$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/'
grep CPUID $clearfile | grep -v Manufacturer | grep -v Name | grep -v  Revision > $file
sed -i 's\CPUID \\g' $file
for i in ` awk '{print $1 $2}'  $file`
do
   zero=`echo $i | sed 's\:\ \' | sed 's\-\ \g' |  awk '{print $1}' `
   eax=`echo $i | sed 's\:\ \' | sed 's\-\ \g' | awk '{print $2}'`
   ebx=`echo $i | sed 's\:\ \' | sed 's\-\ \g' | awk '{print $3}'`
   ecx=`echo $i | sed 's\:\ \' | sed 's\-\ \g' | awk '{print $4}'`
   edx=`echo $i | sed 's\:\ \' | sed 's\-\ \g' | awk '{print $5}'`
   echo $text$zero/eax 0x$eax >> $genfile
   echo $text$zero/ebx 0x$ebx >> $genfile
   echo $text$zero/ecx 0x$ecx >> $genfile
   echo $text$zero/edx 0x$edx >> $genfile
   #echo $zero
   #echo $eax
   #echo $ebx
   #echo $ecx
   #echo $edx
done
