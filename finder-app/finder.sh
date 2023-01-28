# Author Muhammad Usman and Ali Niaz
# Assignment 1 Finder Script

# This scripts expects two commandline arguments
# 1.Path to a Directory
# 2.Text String to be searched within all the files under the given directory

# Script Structure
# First section checks if enough commandline arguments are given
#   if only 1 argument is given the script expects it to be a directory. Even though the program is going to fail and exit in the case of only one commandline argument, we tend to tell the user if it's a valid Directory or not.
#      if valid directory. Raise exception of string missing
#      if invalid directory. Raise exception of directory invalid and string missing
#   else
#      both directory and string missing
#
# 2nd section
# if user provides two commandline arguments the script skips the first section and moves to 2nd section
# checks if the directory is valid or not. IF not, raise exception and exit
#
# 3rd Section
# counts the number of files and grep


#!/bin/bash

if [ $# -le 1 ]
then
	if [ $# -eq 1 ]
	then
		if [ -d $1 ]
		then
			echo "Search String Value Missing"
			echo "Exiting..."
			exit 1
		else
			echo "Invalid Directory and Search String Missing"
			echo "Exiting..."
			exit 1
		fi
	else
		echo "Directory and Search String Values Missing"
		echo "Exiting..."
		exit 1
	fi
fi


filesdir=$1
searchstr=$2

if ! [ -d "$filesdir" ]
then
	echo "Invalid Directory"
	echo "Exiting..."
	exit 1
fi


NUMBER_OF_FILES=$(ls -R $filesdir | grep -v .[/:] | grep -v "^$" | wc -l)
NUMBER_OF_MATCHING=$(cat $filesdir/* | grep -c $searchstr)

echo "The number of files are $NUMBER_OF_FILES and the number of matching lines are $NUMBER_OF_MATCHING"
