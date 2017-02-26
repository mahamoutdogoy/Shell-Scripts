#!/bin/bash

for i in `awk 'BEGIN{FS=":"}{print $1}' < "/etc/passwd"`; do echo "USER #$n = $i"; let "n += 1"; done

