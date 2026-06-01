# Linux Health Dashboard

A Bash-based Linux monitoring utility that provides real-time system information, service health checks, process monitoring, logging, and a simple health scoring system.

## Overview

Linux Health Dashboard is a command-line monitoring tool built using Bash scripting. It helps administrators quickly inspect the health and status of a Linux system by displaying important metrics such as uptime, memory usage, disk usage, open ports, running services, and resource-consuming processes.

The project was built to practice Linux system administration, shell scripting, process monitoring, service management, logging, and automation concepts.

---

## Features

### System Information
- Hostname
- Current user
- Current date and time
- System uptime

### Resource Monitoring
- Memory usage (`free -h`)
- Disk usage (`df -h`)

### Network Monitoring
- Open TCP and UDP listening ports (`ss -tuln`)

### Service Monitoring
Checks the status of:
- SSH
- Nginx
- MySQL

Displays:
- RUNNING
- STOPPED

### Process Monitoring
Shows:
- Top 5 memory-consuming processes
- Top 5 CPU-consuming processes

### Health Score
A simple health scoring mechanism:
- Starts at 100
- Deducts 10 points for each monitored service that is not running

### Logging
Stores execution history in:

```text
logs/healthcheck.log
```

Example:

```text
[Mon Jun 01 10:45:12 IST 2026] Dashboard Executed | Score:80
```

### Execution Time
Displays script execution time in seconds.

---

## Technologies Used

- Bash Shell Scripting
- Linux
- Systemd
- Core Linux Administration Tools

Commands used:

```bash
hostname
whoami
date
uptime
free
df
ss
systemctl
ps
```

---

## Project Structure

```text
health-dashboard/
├── healthcheck.sh
├── logs/
│   └── healthcheck.log
└── README.md
```

---

## Installation

Clone the repository:

```bash
git clone <repository-url>
cd health-dashboard
```

Make the script executable:

```bash
chmod +x healthcheck.sh
```

Run the dashboard:

```bash
./healthcheck.sh
```

---

## Sample Output

```text
=================================
     LINUX HEALTH DASHBOARD
=================================

====== HOSTNAME ======
Hostname: Asus-pradeep

====== CURRENT USER ======
Current User: pradeep

====== SYSTEM UPTIME ======
Uptime: up 3 hours

====== SERVICE STATUS ======
ssh        : RUNNING
nginx      : RUNNING
mysql      : STOPPED

====== HEALTH SCORE ======
System Health: 90/100
```

---

## Learning Outcomes

Through this project, the following Linux concepts were practiced:

- Shell scripting
- Variables
- Functions
- Conditional statements
- Process monitoring
- Service monitoring
- Linux networking basics
- System administration
- Logging
- Automation
- Git version control

---

## Future Improvements

Planned enhancements:

- Email alerts for failed services
- Disk usage threshold warnings
- CPU usage percentage monitoring
- Memory threshold alerts
- Automatic service restart option
- Menu-driven interface
- Export reports to CSV
- Daily scheduled execution using Cron

---

## Author

Pradeep Rathod

Linux Administration Learning Project
