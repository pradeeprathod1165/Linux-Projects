#!/bin/bash

LOGFILE="logs/user-management.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "===================="
echo " USER MANAGEMENT TOOL"
echo "===================="

echo "1. Create User"
echo "2. Delete User"
echo "3. Lock User"
echo "4. Unlock User"
echo "5. List Users"
echo "6. Exit"


read -p "Enter choice: " choice


if [ "$choice" -eq 1 ]
then
	read -p "Enter username: " username

	if id "$username" &>/dev/null

	then
		echo "user already exists."

		echo "[$TIMESTAMP] CREATED FAILED: $username already exists" >> "$LOGFILE"
	else

	        sudo useradd -m "$username"

	        echo "[$TIMESTAMP] USER CREATED: $username" >> "$LOGFILE"
 
        	echo "User created successfully"
	fi

elif [ "$choice" -eq 2 ]
then
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then
        	sudo userdel -r "$username"

        	echo "[$TIMESTAMP] USER DELETED: $username" >> "$LOGFILE"

	        echo "User deleted successfully"
	else
		echo "user does not exist."

		echo "[$TIMESTAMP] DELETE FAILED: $username not found" >> "$LOGFILE"
	fi

elif [ "$choice" -eq 3 ]
then
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then

        	sudo usermod -L "$username"

        	echo "[$TIMESTAMP] USER LOCKED: $username" >> "$LOGFILE"

	        echo "User locked successfully"
	else
		echo "user does not exist."
	fi


elif [ "$choice" -eq 4 ]
then
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then

        	sudo usermod -U "$username"
  
        	echo "[$TIMESTAMP] USER UNLOCKED: $username" >> "$LOGFILE"
 
        	echo "User Unlocked successfully"
	fi


elif [ "$choice" -eq 5 ]
then
	echo

	#echo "===== USER LIST ====="
#list everything 
       # cut -d: -f1 /etc/passwd

       echo "===== Regular USER ====="

       awk -F: '$3 >=1000 {print $1}' /etc/passwd

else
	echo "EXiting......"
fi


