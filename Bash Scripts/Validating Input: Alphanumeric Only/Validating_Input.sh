#!/bin/bash

echo "Please enter only alphabetical and numeric characters"
echo

read input
validated_input=`echo "$input" | sed -e 's/[^[:alnum:]]//g'`

if [[ "$input" != "$validated_input" ]] ; then 
	echo "Please enter only letters and numbers."
	exit 1
else
	echo "Input is valid."
fi
