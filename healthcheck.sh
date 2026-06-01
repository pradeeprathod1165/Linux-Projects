#!/bin/bash

echo "=============================="
echo     LINUX HEALTH DASHBOARD
echo "=============================="

echo
echo "======= HOSTNAME ======="
HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"

echo
echo "====== CURRENT USER ======"
USER=$(whoami)
echo "Current User: $USER"

echo
echo "====== DATE ======"
DATE=$(date)
echo "Date: $DATE"

echo
echo "====== SYSTEM UPTIME ======"
UPTIME=$(uptime -p)
echo "uptime: $UPTIME"

echo
echo "====== MEMORY USAGE ======"
free -h

echo
echo "====== DISK USAGE ======"
df -h

echo
echo "====== OPEN PORTS ======"
ss -tuln


