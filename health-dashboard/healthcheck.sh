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



check_service() {
     service_name=$1

     if systemctl is-active --quiet "$service_name"
      then
	      printf "%-10s : RUNNING\n" "$service_name"

      else
	      printf "%-10s : STOPPED\n" "$service_name"
     fi
}


echo
echo "====== SERVICE STATUS ======="
check_service ssh
check_service nginx
check_service mysql


echo
echo "====== TOP MEMORY PROCESSES ======"
ps aux --sort=-%mem | head -5

echo 
echo "====== TOP CPU PROCESSES ======"
ps aux --sort=-%cpu | head -5


echo
HEALTH_SCORE=100

if ! systemctl is-active --quiet ssh
then
	HEALTH_SCORE=$((HEALTH_SCORE-10))
fi


if ! systemctl is-active --quiet nginx
then
	HEALTH_SCORE=$((HEALTH_SCORE-10))
fi


if ! systemctl is-active --quiet mysql
then
	HEALTH_SCORE=$((HEALTH_SCORE-10))
fi


echo
echo "====== HEALTH SCORE ======"
echo "System Health: $HEALTH_SCORE/100"





