#!/bin/bash

# ==========================
# Linux Health Dashboard v1
# ==========================

START_TIME=$(date +%s)

HEALTH_SCORE=100

mkdir -p logs
LOGFILE="logs/healthcheck.log"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# ==========================
# Functions
# ==========================

print_section() {
    echo
    echo "====== $1 ======"
}

check_service() {
    local service_name=$1

    if systemctl is-active --quiet "$service_name"
    then
        printf "%-10s : ${GREEN}RUNNING${NC}\n" "$service_name"
    else
        printf "%-10s : ${RED}STOPPED${NC}\n" "$service_name"
        HEALTH_SCORE=$((HEALTH_SCORE - 10))
    fi
}

# ==========================
# Dashboard Header
# ==========================

echo "================================="
echo "     LINUX HEALTH DASHBOARD"
echo "================================="

# ==========================
# System Information
# ==========================

HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
CURRENT_DATE=$(date)
UPTIME=$(uptime -p)

print_section "HOSTNAME"
echo "Hostname: $HOSTNAME"

print_section "CURRENT USER"
echo "Current User: $CURRENT_USER"

print_section "DATE"
echo "Date: $CURRENT_DATE"

print_section "SYSTEM UPTIME"
echo "Uptime: $UPTIME"

# ==========================
# Memory & Disk
# ==========================

print_section "MEMORY USAGE"
free -h

print_section "DISK USAGE"
df -h

# ==========================
# Network
# ==========================

print_section "OPEN PORTS"
ss -tuln

# ==========================
# Services
# ==========================

print_section "SERVICE STATUS"

check_service ssh
check_service nginx
check_service mysql

# ==========================
# Top Processes
# ==========================

print_section "TOP MEMORY PROCESSES"
ps aux --sort=-%mem | head -6

print_section "TOP CPU PROCESSES"
ps aux --sort=-%cpu | head -6

# ==========================
# Health Score
# ==========================

print_section "HEALTH SCORE"
echo "System Health: $HEALTH_SCORE/100"

# ==========================
# Logging
# ==========================

echo "[$(date)] Dashboard Executed | Score:$HEALTH_SCORE" >> "$LOGFILE"

# ==========================
# Execution Time
# ==========================

END_TIME=$(date +%s)
EXECUTION_TIME=$((END_TIME - START_TIME))

print_section "EXECUTION TIME"
echo "Execution Time: ${EXECUTION_TIME}s"
