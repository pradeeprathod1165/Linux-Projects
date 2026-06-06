# Employee Management System

A menu-driven Employee Management System built using Bash scripting. This project demonstrates CRUD (Create, Read, Update, Delete) operations using a CSV file as a lightweight database.

## Features

- Add Employee
- View Employees
- Search Employee by ID
- Update Employee Details
- Delete Employee
- Generate Employee Report
- Activity Logging
- Menu-Driven Interface

---

## Project Structure

```text
employee-management-system/
│
├── employee-manager.sh
├── data/
│   └── employees.csv
├── logs/
│   ├── employee.log
│   └── .gitkeep
├── reports/
│   ├── employee-report.txt
│   └── .gitkeep
├── .gitignore
└── README.md
```

---

## Technologies Used

- Bash Scripting
- Linux Commands
- CSV File Storage
- Git & GitHub

---

## Employee Database Format

Employees are stored in:

```text
data/employees.csv
```

Example:

```csv
101,Pradeep,DevOps Engineer,35000
102,Anjali,HR,30000
103,Rahul,Developer,45000
```

Fields:

| Field | Description |
|---------|------------|
| Employee ID | Unique Employee Identifier |
| Name | Employee Name |
| Department | Employee Department |
| Salary | Employee Salary |

---

## Menu

```text
===== EMPLOYEE MANAGEMENT SYSTEM =====

1 Add Employee
2 View Employees
3 Search Employee
4 Update Employee
5 Delete Employee
6 Generate Report
7 Exit
```

---

## Features Overview

### Add Employee

Adds a new employee record to the CSV database.

Example:

```text
Employee ID: 101
Name: Pradeep
Department: DevOps Engineer
Salary: 35000
```

---

### View Employees

Displays all employee records in a formatted table.

Example:

```text
101        Pradeep         DevOps Engineer     35000
102        Anjali          HR                  30000
```

---

### Search Employee

Searches an employee using Employee ID.

Example:

```text
Enter Employee ID: 101
```

Output:

```text
Employee Found

101        Pradeep         DevOps Engineer     35000
```

---

### Update Employee

Updates existing employee information.

Example:

```text
Employee ID: 101
New Department: DevOps
New Salary: 40000
```

---

### Delete Employee

Removes an employee record from the database.

Example:

```text
Employee ID: 101
```

---

### Generate Report

Creates:

```text
reports/employee-report.txt
```

Sample:

```text
===== EMPLOYEE REPORT =====

Total Employees: 3

Employee List:
------------------------
101        Pradeep         DevOps Engineer     35000
102        Anjali          HR                  30000
103        Rahul           Developer           45000

Generated On:
Fri Jun 05 2026
```

---

## Logging

All important operations are recorded in:

```text
logs/employee.log
```

Example:

```text
[2026-06-05_10-15-21] EMPLOYEE ADDED: 101
[2026-06-05_10-16-02] EMPLOYEE UPDATED: 101
[2026-06-05_10-18-44] EMPLOYEE DELETED: 102
```

---

## Linux Commands Used

| Command | Purpose |
|----------|----------|
| grep | Search employee records |
| awk | Format employee data |
| sed | Update and delete records |
| wc | Count employees |
| date | Generate timestamps |
| cat | Display files |

---

## Skills Demonstrated

- Bash Scripting
- Linux Administration
- CSV Data Management
- CRUD Operations
- Logging
- Report Generation
- Text Processing
- Git Version Control

---

## Learning Outcomes

Through this project, I learned:

- File handling in Bash
- Building menu-driven applications
- Managing structured data using CSV
- Using grep, awk, and sed effectively
- Logging administrative actions
- Generating automated reports

---

## Future Enhancements

- Search by Name
- Search by Department
- Salary Statistics
- Employee Sorting
- CSV Export
- Backup & Restore
- Password-Protected Access

---

## Author

Pradeep Rathod

Linux Administration & DevOps Learning Portfolio
