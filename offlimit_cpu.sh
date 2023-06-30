#!/bin/bash
#A Script that checks if the cpu idleness is lower or moderate or higher
#100 - 80 -> Normal
#70 - 50 -> Moderate
#40 - 1 -> Danger

#Default
COUNTER=5
INTERVAL=2

#List
declare -a MY_ARRAY=()

#regex 
re="AAA \(bbb [[:digit:]]+\) CCC"

# #Asking for the input count for the processes
# read -p "Enter the number of Count: " ANSWER_ONE

# #If conditon to start the operation
# if ! [[$ANSWER_ONE =~ $re]];then
# 	echo "Your entry is not a number. Pls it should a number.:)";
# else
read -p "Enter Default[1] || Custom[2] : " ANSWER_ONE
case "$ANSWER_ONE" in
	[1])
		
			MY_LIST=$(sar -u $INTERVAL $i | awk '{print $9}')
			echo "$MY_LIST"
			$MY_ARRAY+=($MY_LIST)
		done
		;;
	*)
		echo "[1]->Default or [2]->Custom. Number pls.:)";
		;;
esac

