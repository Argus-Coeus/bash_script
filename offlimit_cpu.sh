#!/bin/bash
#A Script that checks if the cpu idleness is lower or moderate or higher
#100 - 80 -> Normal
#70 - 50 -> Moderate
#40 - 1 -> Danger

#Default
COUNTER=1
INTERVAL=1
ROW=2


#List
declare -a MY_ARRAY=()

function default_func {
    my_command=$(sar -u 1 1 | grep -v "CPU" | awk 'NR==2 {if($9 < 100.00)print $9}')
	if (( $(echo "$my_command" | awk '{print ($1 <= 100.00 && $1 >= 80.00)}') ));then
		echo "CPU state is Excellent.:)";
	elif (( $(echo "$my_command" | awk '{print ($1 < 80.00 && $1 >= 60.00)}') ));then
		echo "CPU state is Moderate.:)";
	elif (( $(echo "$my_command" | awk '{print ($1 < 60.00 && $1 >= 50.00)}') ));then
		echo "CPU state is Normal.:)";
	elif (( $(echo "$my_command" | awk '{print ($1 < 50.00 && $1 >= 30.00)}') ));then
		echo "CPU Usage is advancing to a critical State. Close some program.:)"
	elif (( $(echo "$my_command" | awk '{print ($1 < 30.00 && $1 >= 00.00)}') ));then
		echo "Danger!!!"
	fi
}

function operation {
	if [ $counter_cus -gt 1 ];then
		my_custom=$(sar -u $interval_cus $counter_cus | grep -v "CPU" | awk 'NR==3 {if($9 < 100.00)print $9}')
	else
		my_custom=$(sar -u $interval_cus $counter_cus | grep -v "CPU" | awk 'NR==2 {if($9 < 100.00)print $9}')
	fi
}

function custom_func {
	
	operation

	if (( $(echo "$my_custom" | awk '{print ($1 <= 100.00 && $1 >= 80.00)}') ));then
		echo "CPU state is Excellent.:)";
	elif (( $(echo "$my_custom" | awk '{print ($1 < 80.00 && $1 >= 60.00)}') ));then
		echo "CPU state is Moderate.:)";
	elif (( $(echo "$my_custom" | awk '{print ($1 < 60.00 && $1 >= 50.00)}') ));then
		echo "CPU state is Normal.:)";
	elif (( $(echo "$my_custom" | awk '{print ($1 < 50.00 && $1 >= 30.00)}') ));then
		echo "CPU Usage is advancing to a critical State. Close some program.:)"
	elif (( $(echo "$my_custom" | awk '{print ($1 < 30.00 && $1 >= 00.00)}') ));then
		echo "Danger!!!"
	fi
}


read -p "Enter Default[1] || Custom[2] : " ANSWER_ONE
case "$ANSWER_ONE" in
	[1])
		default_func
		;;
	[2])
		#Seti the counter and interval for the command
		read -p "Enter Counter : " counter_cus
		if ! [[ "$counter_cus" =~ ^[0-9]+$ ]];
   		then
		 	echo "error: Not a number";
		else
			echo "COUNTER = $counter_cus";
			read -p "Enter Interval : " interval_cus
			if ! [[ "$interval_cus" =~ ^[0-9]+$ ]]; 
   			then
		 		echo "error: Not a number";
			else
				echo "INTERVAL = $counter_cus";
				custom_func $interval_cus $counter_cus
			fi
		fi

		
		;;
	*)
		echo "[1]->Default or [2]->Custom. Number pls.:)";
		;;
esac



