#!/bin/bash

BACKUP_DIR="../backups"
WEB_ROOT="/var/www/html"
LOGFILE="../logs/deployment.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/website_$TIMESTAMP.tar.gz"

echo "========================="
echo " WEBSITE BACKUP TOOL"
echo "========================="
echo

if tar -czf "$BACKUP_FILE" "$WEB_ROOT"
then
    echo "Backup created successfully."
    echo "Location: $BACKUP_FILE"

    echo "[$TIMESTAMP] WEBSITE BACKUP CREATED: $BACKUP_FILE" >> "$LOGFILE"
else
    echo "Backup failed."

    echo "[$TIMESTAMP] WEBSITE BACKUP FAILED" >> "$LOGFILE"
fi
