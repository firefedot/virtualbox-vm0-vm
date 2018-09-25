#!/bash/bin

#TaskKill /IM "VirtualBox.exe"
#TaskKill /IM "VBoxSVC.exe"
echo "Enter name vm: "
n1=$1
vboxman="/usr/bin/vboxmanage"
vmscfgdir="${HOME}/VBoxHardenedLoader-5.18/Binary/data"
echo "Enter firm, ex... Samsung, lenovo, etc.:"
firm=$(shuf -n 1 firm.list)
ls | grep .cfg
echo "Enter cpu:"
cpu=$(shuf -n 1 cpu.list)
mac=$(shuf -n 1 mac.list)$(date | md5sum | cut -c -6 |  tr [a-z] [A-Z])
#min1=10000
#max1=30000
#i1=%random%%%(max1-min1+1)+min1
systemSerial=`shuf -i 10000000000000000-99999999999999999 -n 1`
randtext=$(date | md5sum | cut -c -6 |  tr [a-z] [A-Z])
r8=$(date | md5sum | cut -c -8 |  tr [a-z] [A-Z])
r4=$(date | md5sum | cut -c -4 |  tr [a-z] [A-Z])
r41=$(date | md5sum | cut -c -4 |  tr [a-z] [A-Z])
d1=`shuf -i 1-28 -n 1`
d2=`shuf -i 1-12 -n 1`
d3=`shuf -i 11-15 -n 1`

echo $r8-$r4-$r41 $d1 $d2 $d3

$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVendor" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "GP00.36Y.$(shuf -i 1000-9999 -n 1).B06.090415$(shuf -i 1000-9999 -n 1)"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseDate" "25/05/15"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseMajor" "5"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseMinor" "9"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSFirmwareMajor" "1"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSFirmwareMinor" "0"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemProduct" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVersion" "1.5"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" "IRU$systemSerial"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSKU" "${randtext}A#ACB"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemFamily" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemUuid" "B5FA5000-9405-81E0-3ADA-F46D045CB676"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVendor" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardProduct" "Mac-${r8}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVersion" "0.3"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardSerial" "BS${r8}3901234567"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardAssetTag" "Symantec Board Asset Tag"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardLocInChass" "Board Localisation In"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiBoardBoardType" 10
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiChassisVendor" "${firm}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiChassisType" 10
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiChassisVersion" "Mac-${r8}"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiChassisSerial" "CSN19345645001234567"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiChassisAssetTag" "BlackBook"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiOEMVBoxVer" "Extended version info: 1.10.00"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/DmiOEMVBoxRev" "Extended revision info: 1B"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port0/ModelNumber" "${firm} 351JI"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port0/FirmwareRevision" "ES2KA61F"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "103024L1T2V1KA"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/ModelNumber" "Slimtype DVD D FX8C9SH"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/FirmwareRevision" "33BL"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/SerialNumber" "AFNOGT258256789"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/ATAPIVendorId" "Slimtype"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/ATAPIProductId" "DVD A FR5A8SH"
$vboxman setextradata "$n1" "VBoxInternal/Devices/ahci/0/Config/Port1/ATAPIRevision" "33BL"
$vboxman setextradata "$n1" CustomVideoMode1 1366x768x32
$vboxman setextradata "$n1" CustomVideoMode2 1440x900x32
$vboxman setextradata "$n1" CustomVideoMode3 1600x900x32
$vboxman setextradata "$n1" CustomVideoMode4 1920x1080x32

#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000002/eax 0x65746e49
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000002/ebx 0x2952286c
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000002/ecx 0x726f4320
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000002/edx 0x4d542865
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000003/eax 0x43203229
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000003/ebx 0x20205550
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000003/ecx 0x20202020
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000003/edx 0x20202020
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000004/eax 0x30303636
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000004/ebx 0x20402020
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000004/ecx 0x30342e32
#$vboxman setextradata "$n1" VBoxInternal/CPUM/HostCPUID/80000004/edx 0x007a4847

source ./${cpu}.cfg
acpi0em=`echo ${firm} | cut -c -6`
$vboxman setextradata "$n1" "VBoxInternal/Devices/acpi/0/Config/AcpiOemId" "${acpi0em}"
$vboxman modifyvm "$n1" --macaddress1 $mac
$vboxman modifyvm "$n1" --paravirtprovider legacy

cd $vmscfgdir/

#$vboxman setextradata "$n1" "VBoxInternal/Devices/acpi/0/Config/DsdtFilePath" "$vmscfgdir/ACPI-DSDT.bin"
#$vboxman setextradata "$n1" "VBoxInternal/Devices/acpi/0/Config/SsdtFilePath" "$vmscfgdir/ACPI-SSDT1.bin"
$vboxman setextradata "$n1" "VBoxInternal/Devices/vga/0/Config/BiosRom" "$vmscfgdir/videorom.bin"
$vboxman setextradata "$n1" "VBoxInternal/Devices/pcbios/0/Config/BiosRom" "$vmscfgdir/pcbios.bin"
$vboxman setextradata "$n1"  "VBoxInternal/Devices/pcbios/0/Config/LanBootRom" "$vmscfgdir/pxerom.bin"
$vboxman modifyvm "$n1" --bioslogoimagepath  "$vmscfgdir/splash.bmp"
$vboxman modifyvm "$n1" --natnet1 "192.168.0/24"


