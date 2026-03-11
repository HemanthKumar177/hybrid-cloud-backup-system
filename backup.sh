#!/bin/bash

# =======================
# Author Hemanth Kumar HV
# 4 March 2026.
# =======================


# ===============================
# Hybrid Cloud Backup Script
# Local Server (Ubuntu) + AWS S3
# ===============================

# Source directory containing files to backup
SOURCE_DIR="/home/hemanthhk/hybrid-cloud-backup/data"

if [ ! -d $SOURCE_DIR ] 
then 
	echo " Directory does not exist : $SOURCE_DIR "
	exit 1
fi

# Local backup storage directory
BACKUP_DIR="/home/hemanthhk/hybrid-cloud-backup/backups"


if [ ! -d $BACKUP_DIR ]
then 
	echo " NO such Directory : $BACKUP_DIR"
	exit 1
fi

# Log file location
LOG_FILE="/home/hemanthhk/hybrid-cloud-backup/logs/backup.log"

# AWS S3 bucket name
BUCKET_NAME="hemanth-hybrid-backup"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Starting backup process..."

# Create compressed backup
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "$(date) - Backup created: $BACKUP_FILE" >> $LOG_FILE

# Upload backup to AWS S3
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/

echo "$(date) - Backup uploaded to AWS S3" >> $LOG_FILE

# Delete backups older than 7 days
find $BACKUP_DIR -type f -mtime +7 -delete

echo "$(date) - Old backups cleaned" >> $LOG_FILE

echo "Backup process completed!"

