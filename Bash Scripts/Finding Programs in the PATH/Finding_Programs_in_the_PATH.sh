#!/bin/bash

enter_command() {
echo "Please enter a command, which to be tested if in PATH:"
echo

read test_command

	[[ -z $test_command ]] && echo "No command found, exiting..." && exit 123
}
enter_command

path_dirs=(`echo $PATH | sed -e 's/\:/ /g'`)
actual_command=`echo $test_command | sed -e 's/\// /g' | xargs -n1 | tac | sed -n '1p'`

for i in ${path_dirs[*]} ; do 
	if_available=(`find "$i" -xdev -type f -name "$actual_command" 2> /dev/null`)

	if [[ $if_available == "" ]] ; then 
		: 
	else
		echo $if_available >> temp_file.txt
	fi
done

if [[ -f temp_file.txt ]] ; then 
	echo "`cat temp_file.txt 2> /dev/null` found in PATH."
else
	echo "$actual_command" not found in PATH.
fi

rm -f temp_file.txt







