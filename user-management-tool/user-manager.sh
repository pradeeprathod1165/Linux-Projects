#!/bin/bash

mkdir -p logs
mkdir -p reports

LOGFILE="logs/user-management.log"

create_user() {
	read -p "Enter username: " username

	if id "$username" &>/dev/null

	then
		echo "user already exists."

		echo "[$(date +"%Y-%m-%d_%H-%M-%S")] CREATED FAILED: $username already exists" >> "$LOGFILE"
	else

	        sudo useradd -m "$username"

	        echo "[$(date +"%Y-%m-%d_%H-%M-%S")] USER CREATED: $username" >> "$LOGFILE"
 
        	echo "User created successfully"
	fi
}

delete_user() {
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then
        	sudo userdel -r "$username"

        	echo "[$(date +"%Y-%m-%d_%H-%M-%S")] USER DELETED: $username" >> "$LOGFILE"

	        echo "User deleted successfully"
	else
		echo "user does not exist."

		echo "[$(date +"%Y-%m-%d_%H-%M-%S")] DELETE FAILED: $username not found" >> "$LOGFILE"
	fi
}

lock_user() {
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then

        	sudo usermod -L "$username"

        	echo "[$(date +"%Y-%m-%d_%H-%M-%S")] USER LOCKED: $username" >> "$LOGFILE"

	        echo "User locked successfully"
	else
		echo "user does not exist."
	fi
}

unlock_user() {
	read -p "Enter username: " username
	if id "$username" &>/dev/null
	then

        	sudo usermod -U "$username"
  
        	echo "[$(date +"%Y-%m-%d_%H-%M-%S")] USER UNLOCKED: $username" >> "$LOGFILE"
 
        	echo "User Unlocked successfully"
	else
		echo "user does not exist."
	fi
}

list_users() {
	echo

	#echo "===== USER LIST ====="
#list everything 
       # cut -d: -f1 /etc/passwd

       echo "===== Regular USER ====="

       awk -F: '$3 >=1000 {print $1}' /etc/passwd
}

generate_report() {

    REPORT_FILE="reports/user-report.txt"

    TOTAL_USERS=$(awk -F: '$3 >= 1000 {count++} END {print count}' /etc/passwd)

    {
        echo "===== USER REPORT ====="
        echo
        echo "Total Regular Users: $TOTAL_USERS"
        echo
        echo "Users:"
        echo "----------------"

        awk -F: '$3 >= 1000 {print $1}' /etc/passwd

        echo
        echo "Generated On:"
        date
    } > "$REPORT_FILE"

    echo "Report generated successfully."
    echo "Location: $REPORT_FILE"

    echo "[$(date +"%Y-%m-%d_%H-%M-%S")] REPORT GENERATED" >> "$LOGFILE"
}


echo "===================="
echo " USER MANAGEMENT TOOL"
echo "===================="

echo "1 Create User"
echo "2 Delete User"
echo "3 Lock User"
echo "4 Unlock User"
echo "5 List Users"
echo "6 Generate Report"
echo "7 Exit"

read -p "Enter choice: " choice

case $choice in 
	1)
		create_user
		;;
	2)
		delete_user
		;;
	3)
		lock_user
		;;
	4)
		unlock_user
		;;
	5)
		list_users
		;;
	6)
		generate_report
		;;
	7)
		echo Exiting....
		exit 0
		;;
	*)
		echo "Invalid choice"
		;;
esac

