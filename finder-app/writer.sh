#!/bin/bash

# check if number of arguments = 2 or not.
if [ ! $# -eq 2 ]; then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "the order of the arguments should be:"
	echo "	1) Path to the file."
	echo "	2) String to be written in the specified file"
	exit 1
fi
file_path=$1


# Check if it possible to create a file to the path in argument 1
if ! echo "$2" >"$file_path"; then
	echo "Error: Could not create file at $file_path"
	exit 1
fi
