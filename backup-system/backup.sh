#!/bin/bash

SOURCE_DIR="test-data"
BACKUP_DIR="backups"
LOGFILE="logs/backup.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUPFILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if tar -czvf "$BACKUPFILE" "$SOURCE_DIR"
then
	echo "Backup created successfully."
	echo "$BACKUPFILE"
        echo "[$TIMESTAMP] SUCCESS: $BACKUPFILE created" >> "$LOGFILE"
else
	echo "Backup failed."
	echo "[$TIMESTAMP] FAILED: Backup creation failed" >> "$LOGFILE"
fi



