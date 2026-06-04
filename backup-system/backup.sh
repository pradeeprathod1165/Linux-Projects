#!/bin/bash

cd "$(dirname "$0")" || exit 1

SOURCE_DIR="test-data"
BACKUP_DIR="backups"
LOGFILE="logs/backup.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUPFILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if tar -czvf "$BACKUPFILE" "$SOURCE_DIR"
then

    if [ -f "$BACKUPFILE" ] && [ -s "$BACKUPFILE" ]
    then
        echo "Backup verified successfully."
        echo "[$TIMESTAMP] SUCCESS: $BACKUPFILE created" >> "$LOGFILE"

    else
        echo "Backup verification failed."
        echo "[$TIMESTAMP] ERROR: Backup file invalid" >> "$LOGFILE"
    fi

else
    echo "Backup creation failed."
    echo "[$TIMESTAMP] FAILED: Backup creation failed" >> "$LOGFILE"
fi

