#!/bin/bash
arr=(`cat /tmp/ip_nodes.txt`)
echo "--- Please enter a commant you'd like to execute on all nodes ---"
read com1

if [[ $com1 == "" ]] ; then
        echo "Please add a relevant command. Exiting..."
        exit 123
fi

for i in ${arr[*]} ; do
        ssh $i "$com1"
done
