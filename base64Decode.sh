#!/usr/bin/bash 

#A code to decode base64 encode string into  base64 decode string.
#The input to determine whether the script should gone on
read -p "You want to decode a base64 String? Y/N " ANSWER
#A switch statement to handle the function 
case "${ANSWER}" in [yY] | [yY][eE][sS])

	read -p "Enter base64 String: " STRING
	if  test -z "$STRING"
	then
		echo "Check your entry."
	else 
		echo "----------DECODE----------"
		echo -n "${STRING}" | base64 --decode 2> ~/tmp;
	fi
	;;
	[nN] | [nN][oO])
		echo "Thank you for using this script "
		;;
	*)
		echo "Enter the required Input :),Please."
esac

