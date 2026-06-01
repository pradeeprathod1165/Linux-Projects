#!/bin/bash

SOURCE_DIR="test-data"
BACKUP_DIR="backups"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUPFILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

tar -czvf "$BACKUPFILE" "$SOURCE_DIR"

echo "Backup Created"
echo "$BACKUPFILE"
