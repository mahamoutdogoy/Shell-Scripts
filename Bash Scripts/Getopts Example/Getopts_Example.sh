#!/bin/bash
 
while getopts ":a :b" opt ; do  
  case $opt in
	a) echo "-a is a valid argument!" >&2 ;;
	b) echo "-b is a valid argument!" >&2 ;;
	*) echo "Invalid option: -$OPTARG" >&2 ;;
  esac
done
