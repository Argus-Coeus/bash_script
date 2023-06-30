#!/usr/bin/bash
# A script that run update and upgrade for the machine

#Entries prompt to ask if whether you want to check for update and upgrade
read -p "Do you want to check for: [Update[1] or Update and Upgrade [2]:: " ANSWER

#A switch statement condition to implement the choice
case $ANSWER in
       	[1])
		echo "Updating...";
		sudo apt-get update
		echo "Updated...";
	;;
	[2])
		echo "Updating and Upgrading..."
		sudo apt-get update && sudo apt-get upgrade
		echo "Updated And Upgraded..."
	;;
	*)
		echo "Invalid data entry in the prompt."
		;;
esac

			 

