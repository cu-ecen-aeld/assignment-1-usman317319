#!/bin/bash

R='\033[0;31m'
G='\033[0;32m'
NOCOLOR='\033[0m'


if [ $# -eq 2 ]
then
	writefile=$1
	writestr=$2

	if [ -e $writefile ] # Checks if the file exists
	then
		if [ -f $writefile ] # Checks if the file is a regular file (text file)
		then
			echo "Attempting writing data to the $writefile"
			echo "$writestr" > $writefile
			echo -e "${G}Data Writing Completed...${NOCOLOR}"
		fi
	elif ! [ -e $writefile ] # Checks if the files doesn't exists and needs to be created
	then
		dir=$(dirname $writefile)
		if [ -d $dir ] # Checks if the directory exists
		then
			touch $writefile
			echo "Attempting writing data to the $writefile"
			echo "$writestr" > $writefile
			echo -e "${G}Data Writing Completed Successfully...${NOCOLOR}"
		elif ! [ -d $dir ] # Checks if the directory doesn't exists and needs to be created
		then
			echo -e "${G}Creating Directory...${NOCOLOR}"
			mkdir $dir     # Creates the Directory
			echo -e "${G}Directory Created Successfully"
			touch $writefile  # Created the touch file
			echo -e "Attempting writing data to the $writefile"
			echo "$writestr" > $writefile   # Writing data to the file
			echo -e "${G}Data Writing Completed Successfully...${NOCOLOR}"
		fi
	fi
else
	if [ $# -eq 1 ]
	then
		echo -e "${R}String Value Missing${NOCOLOR}"
		echo -e "${R}Exiting...${NOCOLOR}"
		exit 1
	elif [ $# -eq 0 ]
	then
		echo -e "${R}File and String Value Missing${NOCOLOR}"
		echo -e "${R}Exiting...${NOCOLOR}"
		exit 1
	fi
fi
