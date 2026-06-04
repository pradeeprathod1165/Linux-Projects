# Linux User Management Tool

A Bash-based Linux administration tool that automates common user management tasks such as creating, deleting, locking, unlocking, listing users, and generating user reports.

## Features

- Create new users
- Delete existing users
- Lock user accounts
- Unlock user accounts
- List regular users
- Generate user reports
- User existence validation
- Activity logging
- Menu-driven interface

## Technologies Used

- Bash Scripting
- Linux User Management Commands
- AWK
- Git & GitHub

## Project Structure

```text
user-management-tool/
│
├── user-manager.sh
├── logs/
│   └── .gitkeep
├── reports/
│   └── .gitkeep
├── .gitignore
└── README.md
```

## Linux Commands Used

| Command | Purpose |
|----------|----------|
| useradd | Create user |
| userdel | Delete user |
| usermod | Lock/Unlock user |
| id | Check user existence |
| awk | Parse user information |
| date | Generate timestamps |
| mkdir | Create directories |

## How to Run

Give execute permission:

```bash
chmod +x user-manager.sh
```

Run the script:

```bash
./user-manager.sh
```

## Menu Options

```text
1 Create User
2 Delete User
3 Lock User
4 Unlock User
5 List Users
6 Generate Report
7 Exit
```

## User Report

The tool generates a report containing:

- Total regular users
- User list
- Report generation date and time

Example:

```text
===== USER REPORT =====

Total Regular Users: 4

Users:
----------------
pradeep
testuser1
testuser2
testuser3

Generated On:
Thu Jun 4 18:14:01 IST 2026
```

## Logging

All important activities are logged in:

```text
logs/user-management.log
```

Example:

```text
[2026-06-04_18-00-15] USER CREATED: testuser1
[2026-06-04_18-02-10] USER LOCKED: testuser1
[2026-06-04_18-05-45] USER DELETED: testuser1
```

## Skills Demonstrated

- Linux System Administration
- User Management
- Shell Scripting
- File Handling
- Logging and Monitoring
- Report Generation
- Linux Account Management
- Git Version Control

## Learning Outcomes

Through this project, I learned:

- Linux user administration
- Bash scripting fundamentals
- Functions and case statements
- User validation techniques
- Log management
- Report generation using AWK
- GitHub project management

## Author

Pradeep Rathod

Linux Administration & DevOps Learning Portfolio
