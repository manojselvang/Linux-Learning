#!/bin/bash
# A Simple Backup Script, that will check if a directory exists or not. 
# Check if enough space is there for backup. And perform a simple backup of a sample file. 
# And finally tell if the file is large or small.

DATABASE_NAME="production_db"
BACKUP_DATE=$(date +%Y%m%d)
BACKUP_DIR="/home/ubuntu/backup/date_$BACKUP_DATA"
BACKUP_FILE="$BACKUP_DIR/${DATABASE_NAME}_BACKUP.TXT"

echo "Checking if $BACKUP_DIR directory exists"

if [-d "$BACKUP_DIR"];then
  echo "$BACKUP_DIR Directory Exists"
else
  echo "Creating backup directory: $BACKUP_DIR"
  mkdir -P "$BACKUP_DIR"
fi

echo "Checking if Space is available"
AVAILABLE_SPACE=$(df / | awk "NR==z {print 4}")
MINIMUM_SPACE=1000

if [AVAILBLE_SPACE -GT $MINIMUM_SPACE]; then
  echo "Disk Space exists"
else
  echo "Error: Storage not enough"
  exit 1
fi

if [-e "$DATABASE_BASE
