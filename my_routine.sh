#!/bin/usr/env bash
#A Script that launches your daily browsers and program for you.
#This script takes in your daily routine programs 
#The daily program are inserted by you manually
#A list of the programs, you want to run as routine
declare -a  ROUTINE=( 
[0]=google-chrome
[1]=brave-browser
[2]=code
)
#Asking if you to launch your routine programs
read -p "Do  you want to launch the routine programs: [Y/N] : " ANSWER

#A switch statement to handle the routine
case $ANSWER in 
	[yY] | [yY][eE][sS])
		echo "Here you go :)"
		echo "Starting...";
		for RUNNERS in ${ROUTINE[@]}; 
		do
			echo "$RUNNERS"
			${RUNNERS}
		done
		echo "It's Done..."
		echo "It's a honour to serve you.";
		;;  
	[nN] | [nN][oO])
		echo "Hope, to  serve you another day.:)";
		;;
	*)
		echo "Check your input entry."
		echo "Placeholder Allowed: Y/y/Yes | N/n/No."
		;;
esac

