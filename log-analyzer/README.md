# Linux Log Analyzer & Monitoring Tool

A Bash-based log monitoring and analysis tool that helps system administrators analyze log files, identify errors, detect failed login attempts, generate reports, and monitor logs in real time.

## Features

- Log file validation
- Count total log entries
- Count INFO messages
- Count WARNING messages
- Count ERROR messages
- Analyze most common error messages
- Detect failed login attempts
- Generate log analysis reports
- Real-time log monitoring using `tail -f`
- Menu-driven interface

## Technologies Used

- Bash Scripting
- Linux Text Processing Utilities
- grep
- cut
- sed
- sort
- uniq
- tail
- Git & GitHub

## Project Structure

```text
log-analyzer/
│
├── log-analyzer.sh
├── logs/
│   ├── system.log
│   └── .gitkeep
├── reports/
│   ├── log-report.txt
│   └── .gitkeep
├── .gitignore
└── README.md
```

## Linux Commands Used

| Command | Purpose |
|----------|----------|
| grep | Search log entries |
| grep -c | Count matching entries |
| wc -l | Count total lines |
| cut | Extract fields from logs |
| sed | Remove unwanted spaces |
| sort | Sort log data |
| uniq -c | Count duplicate entries |
| tail -f | Monitor logs in real time |
| date | Generate timestamps |

## Sample Log File

```text
INFO: Service started
ERROR: Database connection failed
ERROR: Database connection failed
WARNING: Disk usage high
ERROR: Permission denied
ERROR: Permission denied
FAILED LOGIN: admin
FAILED LOGIN: root
FAILED LOGIN: root
INFO: User login successful
```

## How to Run

Give execute permission:

```bash
chmod +x log-analyzer.sh
```

Run the script:

```bash
./log-analyzer.sh
```

## Menu Options

```text
1 Display Statistics
2 Show Top Errors
3 Show Failed Login Analysis
4 Generate Report
5 Monitor Logs
6 Exit
```

## Statistics Example

```text
Total Lines: 10
Total Warnings: 1
Total Errors: 4
Total Infos: 2
```

## Top Error Analysis

Example:

```text
TOP ERROR MESSAGES
------------------
2 Database connection failed
2 Permission denied
```

## Failed Login Analysis

Example:

```text
FAILED LOGIN ANALYSIS
---------------------
1 admin
2 root
```

## Report Generation

The tool generates:

```text
reports/log-report.txt
```

Example:

```text
==== LOG ANALYSIS REPORT ====

Total Lines: 10
Total Warnings: 1
Total Errors: 4
Total Infos: 2

TOP ERROR MESSAGES
------------------
2 Database connection failed
2 Permission denied

FAILED LOGIN ANALYSIS
---------------------
1 admin
2 root

Generated On:
Fri Jun 05 2026
```

## Real-Time Monitoring

Monitor logs live:

```bash
tail -f logs/system.log
```

The tool provides a menu option that continuously watches the log file and displays new entries as they are added.

Press:

```text
Ctrl + C
```

to stop monitoring.

## Skills Demonstrated

- Linux Administration
- Log Analysis
- Security Monitoring
- Bash Scripting
- Text Processing
- Report Generation
- Real-Time Monitoring
- Troubleshooting
- Git Version Control

## Learning Outcomes

Through this project, I learned:

- Log parsing and analysis
- Linux text-processing commands
- Error detection techniques
- Failed login monitoring
- Bash functions and menu-driven scripting
- Report generation
- Real-time log monitoring
- Linux troubleshooting fundamentals

## Future Enhancements

- Email alerts for critical errors
- Colorized terminal output
- Daily automated reports using Cron
- System log integration (`/var/log/syslog`)
- Suspicious activity detection
- Error severity classification

## Author

Pradeep Rathod

Linux Administration & DevOps Learning Portfolio
