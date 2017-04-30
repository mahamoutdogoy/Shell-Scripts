#!/bin/bash

vm=$(ps -ef | grep -i '/usr/lib/virtualbox/VirtualBox --comment' | grep -v grep | awk {'print $10'})
for i in ${vm[*]} ; do su -c "VBoxManage controlvm $i savestate" -s /bin/bash `whoami`  ; done
