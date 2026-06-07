# Production Web Server

A Linux Administration and DevOps project that demonstrates web server deployment, service monitoring, automated deployment, and website backup using Nginx and Bash scripting.

## Overview

This project simulates a basic production web server environment. It includes a hosted website, deployment automation, health monitoring, and backup management.

The goal is to gain hands-on experience with Linux system administration, web hosting, service management, and deployment workflows.

---

## Features

* Nginx Web Server Setup
* Website Hosting
* Service Status Monitoring
* Automated Website Deployment
* Website Backup System
* Deployment Logging
* Health Verification using HTTP Requests
* Linux Service Management

---

## Project Structure

```text
production-web-server/
│
├── website/
│   └── index.html
│
├── scripts/
│   ├── status.sh
│   ├── deploy.sh
│   └── backup-site.sh
│
├── backups/
│   └── website_YYYY-MM-DD_HH-MM-SS.tar.gz
│
├── logs/
│   └── deployment.log
│
└── README.md
```

---

## Technologies Used

* Linux
* Bash Scripting
* Nginx
* Systemd
* Curl
* Tar
* Git & GitHub

---

## Website Deployment

The website source file is stored in:

```text
website/index.html
```

Deployment is automated using:

```bash
./scripts/deploy.sh
```

The script:

1. Verifies website files exist.
2. Copies files to the Nginx web root.
3. Reloads Nginx.
4. Verifies the deployment.
5. Records deployment activity in logs.

---

## Website Backup

Create a backup of the live website:

```bash
./scripts/backup-site.sh
```

Backups are stored in:

```text
backups/
```

Example:

```text
website_2026-06-07_20-15-30.tar.gz
```

---

## Service Monitoring

Check web server health:

```bash
./scripts/status.sh
```

The script verifies:

* Nginx service status
* Port 80 availability
* HTTP response status

Example Output:

```text
WEB SERVER STATUS

NGINX STATUS
------------
active

PORT CHECK
----------
LISTEN ...

WEBSITE TEST
------------
HTTP/1.1 200 OK
```

---

## Logging

Deployment and backup activities are recorded in:

```text
logs/deployment.log
```

Example:

```text
[2026-06-07_20-15-30] DEPLOY SUCCESS
[2026-06-07_20-20-10] WEBSITE BACKUP CREATED
```

---

## Linux Commands Practiced

| Command   | Purpose                  |
| --------- | ------------------------ |
| systemctl | Service management       |
| nginx     | Web server configuration |
| curl      | Website verification     |
| ss        | Port monitoring          |
| tar       | Backup creation          |
| cp        | Deployment               |
| mkdir     | Directory creation       |
| grep      | Log analysis             |
| date      | Timestamp generation     |

---

## Skills Demonstrated

* Linux Administration
* Web Server Management
* Nginx Configuration
* Bash Scripting
* Deployment Automation
* Service Monitoring
* Backup Management
* Logging and Auditing
* Troubleshooting
* Git Version Control

---

## Learning Outcomes

Through this project, I learned:

* How to install and manage Nginx
* How web servers serve content
* How to troubleshoot port conflicts
* How to automate deployments using Bash
* How to monitor service health
* How to create website backups
* How production deployment workflows operate

---

## Future Enhancements

* Restore Website from Backup
* Automatic Backup Before Deployment
* Deployment Rollback
* SSL/TLS Configuration
* Virtual Hosts
* Reverse Proxy Configuration
* Firewall Automation
* Cron-Based Scheduled Backups

---

## Author

Pradeep Rathod

Linux Administration & DevOps Learning Portfolio

