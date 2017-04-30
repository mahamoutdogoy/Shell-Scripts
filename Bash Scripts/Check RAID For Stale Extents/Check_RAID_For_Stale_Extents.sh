#!/bin/bash

for vg in `vgdisplay | grep "VG Name" |awk '{print $3}'`; do \
	for lv in `vgdisplay -v $vg |grep "LV Name"|awk '{print $3}'`; do \
		echo "$lv has `lvdisplay -v $lv|grep stale|wc -l` stale extents"; \
	done ; \
done 

