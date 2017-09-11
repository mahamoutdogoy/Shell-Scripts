#!/bin/bash

[[ -e "/root/ip_reporting/ip_reporting.lock" ]] && \
exit 123

node_ip=`ifconfig | head -2 | tail -1 | awk {'print $2'} | sed -e 's/addr\://g'`
ssh 192.168.0.106 "echo $node_ip >> /tmp/ip_nodes.txt" && touch /root/ip_reporting/ip_reporting.lock

