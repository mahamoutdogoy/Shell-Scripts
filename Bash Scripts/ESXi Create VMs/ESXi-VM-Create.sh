#!/bin/sh

phelp() {
        echo "Please choose parameters for the new VM:"
        echo "Usage: ./visteon_vm_setup.sh"
        echo "Options: <|c|i|r|s> -n(name), -c(CPU), -i(Location of the ISO image), -r(RAM size in MB), -s(Storage in GB)"
        echo "Default setup: CPU: 1, RAM: 1024MB, Storage: 20GB"
}


CPU=1
RAM=1024
SIZE=20
ISO=""
FLAG=true
ERR=false

while getopts n:c:i:r:s: option
do
        case $option in
                n)
                                        NAME=${OPTARG};
                                        FLAG=false;
                                        if [ -z $NAME ]; then
                                                ERR=true
                                                MSG="$MSG | Please make sure to enter a VM name."
                                        fi
                                        ;;
                c)
                                        CPU=${OPTARG}
                                        if [ `echo "$CPU" | egrep "^-?[0-9]+$"` ]; then
                                                if [ "$CPU" -le "0" ] || [ "$CPU" -ge "32" ]; then
                                                        ERR=true
                                                        MSG="$MSG | The number of cores has to be between 1 and 32."
                                                fi
                                        else
                                                ERR=true
                                                MSG="$MSG | The CPU core number has to be an integer."
                                        fi
                                        ;;
                                i)
                                        ISO=${OPTARG}
                                        if [ ! `echo "$ISO" | egrep "^.*\.(iso)$"` ]; then
                                                ERR=true
                                                MSG="$MSG | The extension should be .iso"
                                        fi
                                        ;;
                r)
                                        RAM=${OPTARG}
                                        if [ `echo "$RAM" | egrep "^-?[0-9]+$"` ]; then
                                                if [ "$RAM" -le "0" ]; then
                                                        ERR=true
                                                        MSG="$MSG | Please assign more than 1MB memory to the VM."
                                                fi
                                        else
                                                ERR=true
                                                MSG="$MSG | The RAM size has to be an integer."
                                        fi
                                        ;;
                s)
                                        SIZE=${OPTARG}
                                        if [ `echo "$SIZE" | egrep "^-?[0-9]+$"` ]; then
                                                if [ "$SIZE" -le "0" ]; then
                                                        ERR=true
                                                        MSG="$MSG | Please assign more than 1GB for the HDD size."
                                                fi
                                        else
                                                ERR=true
                                                MSG="$MSG | The HDD size has to be an integer."
                                        fi
                                        ;;
                                \?) echo "Unknown option: -$OPTARG" >&2; phelp; exit 1;;
                        :) echo "Missing option argument for -$OPTARG" >&2; phelp; exit 1;;
                        *) echo "Unimplimented option: -$OPTARG" >&2; phelp; exit 1;;
        esac
done

if $FLAG; then
        echo "You need to at least specify the name of the machine with the -n parameter."
        exit 1
fi

if $ERR; then
        echo $MSG
        exit 1
fi

if [ -d "$NAME" ]; then
        echo "Directory - ${NAME} already exists, can't recreate it."
        exit
fi

#Creating the folder for the Virtual Machine
mkdir ${NAME}

#Creating the actual Virtual Disk file (the HDD) with vmkfstools
vmkfstools -c "${SIZE}"G -a lsilogic $NAME/$NAME.vmdk

#Creating the config file
touch $NAME/$NAME.vmx

#writing information into the configuration file
cat << EOF > $NAME/$NAME.vmx

config.version = "8"
virtualHW.version = "7"
vmci0.present = "TRUE"
displayName = "${NAME}"
floppy0.present = "FALSE"
numvcpus = "${CPU}"
scsi0.present = "TRUE"
scsi0.sharedBus = "none"
scsi0.virtualDev = "lsilogic"
memsize = "${RAM}"
scsi0:0.present = "TRUE"
scsi0:0.fileName = "${NAME}.vmdk"
scsi0:0.deviceType = "scsi-hardDisk"
ide1:0.present = "TRUE"
ide1:0.fileName = "${ISO}"
ide1:0.deviceType = "cdrom-image"
pciBridge0.present = "TRUE"
pciBridge4.present = "TRUE"
pciBridge4.virtualDev = "pcieRootPort"
pciBridge4.functions = "8"
pciBridge5.present = "TRUE"
pciBridge5.virtualDev = "pcieRootPort"
pciBridge5.functions = "8"
pciBridge6.present = "TRUE"
pciBridge6.virtualDev = "pcieRootPort"
pciBridge6.functions = "8"
pciBridge7.present = "TRUE"
pciBridge7.virtualDev = "pcieRootPort"
pciBridge7.functions = "8"
ethernet0.pciSlotNumber = "32"
ethernet0.present = "TRUE"
ethernet0.virtualDev = "e1000"
ethernet0.networkName = "Inside"
ethernet0.generatedAddressOffset = "0"
guestOS = "other26xlinux-64"
EOF

#Adding Virtual Machine to VM register - modify your path accordingly!!
MYVM=`vim-cmd solo/registervm /vmfs/volumes/datastore1/${NAME}/${NAME}.vmx`
#Powering up virtual machine:
vim-cmd vmsvc/power.on $MYVM

echo "The Virtual Machine is now setup & the VM has been started up. Your have the following configuration:"
echo "Name: ${NAME}"
echo "CPU: ${CPU}"
echo "RAM: ${RAM}"
echo "HDD-size: ${SIZE}"
if [ -n "$ISO" ]; then
        echo "ISO: ${ISO}"
else
        echo "No ISO added."
fi
echo "Thank you."
exit
