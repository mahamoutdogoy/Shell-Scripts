#!/bin/bash

CSV="," ; for FCSX in `lscfg | grep fcs | awk '{ print $2 }'`;do echo ${FCSX}${CSV}`lscfg -vl ${FCSX} | grep "Network Address" | sed -e "s/^.*\.//"`${CSV}`lscfg -l ${FCSX} | awk '{ print $2 }'`; done

