#!/bin/bash

# check if number of arguments = 2 or not.
if [ ! $# -eq 2 ]; then
	echo "ERROR: Invalid Number of Arguments."
	echo "Total number of arguments should be 2."
	echo "the order of the arguments should be:"
	echo "	1) Path to the file."
	echo "	2) String to be written in the specified file"
	exit 1
else
	# check if the director is a real directory in my file system
	if [ ! -d "$1" ]; then
		echo "ERROR: The Given Directory $1 doesn't exist!"
		exit 1
	fi
fi

# getting number of directories.
#num_directories=`tree $1 | tail -1`
num_directories=${num_directories#*, }

# another way to get the number of files inside the directory and all subdirectories is:
num_files=$(find $1 -type f | wc -l)
# getting the number of matches line in the respective files
searchStr=$2
directory=$1
num_lines=$(grep -r "$searchStr" "$directory" | wc -l)

#echo "The number of files are $num_files"
echo "The number of files are $num_files and the number of matching lines are $num_lines"
