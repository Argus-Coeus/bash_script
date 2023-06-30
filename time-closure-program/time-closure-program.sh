#!/bin/bash
#A time closure program script 
#This script check the time a particular program must be kill or close
#A time for the closure of the program is indicated
#The script provide you with two options, A default option of using the manually saved program and time closure
###Current time 
current_time=$(date +%H:%M)
 
###Default Setting for the script
declare -a default_list=(
[1]="code"
[2]="chrome-browser"
[3]="brave-browser"
);
#Time Closure for the pragrams
#Time Closure Format: 06:30
option_time_closure="10:30";
option_time_start="11:30"
###Custom 
declare -a custom_list=()

###Function 

function default_func {
	operation_func $current_time $option_time_closure $option_time_closure $custom_list
}

function custom_func {
        echo "*************************Current Time : $current_time *****************************";
	#Setting the time closure
        read -p "Enter the time start: FORMAT[02:30] -> " option_time_start
	read -p "Enter the time closure: FORMAT[02:30] -> " option_time_closure
	#Setting the Number of proogram you want to close at that time
	read -p "Number : " ANSWER_FOUR
	for (( i=1 ; i<=$ANSWER_FOUR ; i++ ))
	do 
		#Programs
		read -p  "Enter Program [$i]: " ANSWER_FIVE
		custom_list+=($ANSWER_FIVE)
	done
	listing_array
	operation_func $current_time $option_time_closure $option_time_start $custom_list

}
function listing_array {
        echo "Your Program to be closed :";
	for value in "${custom_list[@]}"
	do
		echo "X -> $value"; 
	done
}

function operation_func {
        
        local starttime=$(date --date="$option_time_start" +"%s")
        local endtime=$(date --date="$option_time_closure" +"%s")
        local currenttime=$(date +%s)
        

        if [ "$currenttime" -ge "$starttime" -a "$currenttime" -ge "$endtime" ];then
                        #An input to get your inner most choice on what you want to do
                        read -p "Do you want to continue with this:) [Yes|No] " ANSWER_TWO
                        #A switch Statement to check the input provided
                        case "$ANSWER_TWO" in 
                                [yY] | [yY][eE][sS])
                                        echo "Time Up:)";
                                        for program in "${custom_list[@]}"
                                        do
                                                echo "Closing these program: ";
                                                echo "$program";
                                                sudo killall "$program";
                                        done
                                        echo "Done:),Thank You for using this Script";
                                        ;;
                                [nN] | [nN][oO])
                                        echo "You are not ready yet. See you again:)";
                                        ;;
                                *)
                                        echo "Incorrect typed In.";
                                        ;;
                        esac
        elif [ "$currenttime" -ge "$starttime" -a "$currenttime" -ge "$endtime" ] && [ ${custom_list[@]} -eq 0 ];then
                echo "You don't have any program to be close.:)";
        else
                        echo "The time you specified is not yet up.";
        fi
}

#Input [Default | Custom]
read -p "Enter your choice: [Default (1) | Custom (2)] : " ANSWER_ONE

#If statement to check the input provided
if [ $((ANSWER_ONE)) == 1 ]; then
	default_func
elif [ $((ANSWER_ONE)) == 2 ]; then
	custom_func
else 
	echo "Specify either 1 or 2. Thank you :)";
fi




