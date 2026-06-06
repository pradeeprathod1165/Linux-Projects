#!/bin/bash

DATAFILE="data/employees.csv"
LOGFILE="logs/employee.log"

mkdir -p data logs reports
touch "$DATAFILE"

add_employee() {
	
	read -p "Enter Employee ID: " emp_id
	read -p "Enter Name: " name
	read -p "Enter Department: " department
	read -p "Enter Salary: " salary

	if grep -q "^$emp_id," "$DATAFILE"
	then
		echo "Employee ID already exists"
		return
	fi

	echo "$emp_id,$name,$department,$salary" >> "$DATAFILE"
	
	echo "Employee added successfully"

	echo "[$(date +"%Y-%m-%d_%H-%M-%S")]EMPLOYEE ADDED: $emp_id" >> "$LOGFILE"
}

view_employees() {

    echo
    echo "===== EMPLOYEE LIST ====="
    echo

    if [ ! -s "$DATAFILE" ]
    then
        echo "No employees found."
        return
    fi

    awk -F, '{printf "%-10s %-15s %-15s %-10s\n", $1,$2,$3,$4}' "$DATAFILE"
}

search_employee() {

	read -p "Enter Employee ID: " emp_id

	if grep -q "^$emp_id," "$DATAFILE"
	then
		echo
		echo "Employee Found"
		echo

		grep "^$emp_id," "$DATAFILE" | 
		awk -F, '{printf "%-10s %-15s %-15s %-10s\n", $1,$2,$3,$4}'

	else
		echo "Employee not found"
	fi
}




echo "============================"
echo "  EMPLOYEE MANAGEMENT SYSTEM"
echo "============================"

echo "1 Add Employee"
echo "2 View Employees"
echo "3 Search Employee"
echo "4 Update Employee"
echo "5 Delete Employee"
echo "6 Generate Report"
echo "7 Exit"

read -p "Enter choice: " choice

case $choice in
	1)
		add_employee
		;;
	2)
		view_employees
		;;
	3)
		search_employee
		;;
	4)
		update_employee
		;;
	5)
		delete_employee
		;;
	6)
		generate_report
		;;
	7)
		echo "Exiting..."
		exit 0
		;;
	*)
		echo "Invalid choice"
		;;
esac

