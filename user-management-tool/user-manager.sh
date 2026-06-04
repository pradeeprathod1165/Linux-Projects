#!/bin/bash

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

	sudo useradd -m "$username"

	echo "User created successfully"

elif [ "$choice" -eq 2 ]
then
	read -p "Enter username: " username

	sudo userdel -r "$username"

	echo "User deleted successfully"

elif [ "$choice" -eq 3 ]
then
	read -p "Enter username: " username

	sudo usermod -L "$username"

	echo "User locked successfully"

elif [ "$choice" -eq 4 ]
then
	read -p "Enter username: " username

	sudo usermod -U "$username"

	echo "User Unlocked successfully"

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


