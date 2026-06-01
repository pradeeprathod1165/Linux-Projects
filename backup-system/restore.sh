#!/bin/bash

BACKUP_FILE=$1
RESTORE_DIR="restored-data"
LOGFILE="logs/backup.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "=============================="
echo "      BACKUP RESTORE TOOL"
echo "=============================="

# Check if backup file exists

if [ ! -f "$BACKUP_FILE" ]
then
echo "Backup file does not exist."

```
echo "[$TIMESTAMP] RESTORE FAILED: $BACKUP_FILE not found" >> "$LOGFILE"

exit 1
```

fi

# Create restore directory if needed

mkdir -p "$RESTORE_DIR"

# Restore backup

tar -xzvf "$BACKUP_FILE" -C "$RESTORE_DIR"

echo
echo "Restore completed successfully."
echo "Restored to: $RESTORE_DIR"

echo "[$TIMESTAMP] RESTORE SUCCESS: $BACKUP_FILE restored" >> "$LOGFILE"

