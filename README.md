# Hybrid Cloud Backup System

## Overview

This project implements a **Hybrid Cloud Backup System** using **Bash scripting, Linux, Cron, and AWS S3**.

The system automatically creates compressed backups of local files, stores them locally, uploads them to an AWS S3 bucket, logs backup activity, and removes old backups.

This demonstrates **automation, cloud integration, and Linux scripting**, which are key concepts used in DevOps environments.

---

## Features

* Automated backups using Bash scripting
* File compression using `tar`
* Upload backups to **AWS S3**
* Maintain logs for backup operations
* Automatically remove backups older than **7 days**
* Scheduled execution using **cron**

---

## Technologies Used

* Linux (Ubuntu)
* Bash Scripting
* AWS CLI
* Amazon S3
* Cron Scheduler
* Git & GitHub

---

## Project Architecture

Local Server (Ubuntu)

```
data folder
      │
      ▼
backup.sh script
      │
      ▼
Create compressed backup (.tar.gz)
      │
      ▼
Store backup in local backups directory
      │
      ▼
Upload backup to AWS S3 bucket
      │
      ▼
Write logs to logs/backup.log
```

---

## Directory Structure

```
hybrid-cloud-backup-system
│
├── backup.sh        # Main backup automation script
├── data/            # Files to backup
├── backups/         # Local backup storage
├── logs/            # Backup logs
└── README.md        # Project documentation
```

---

## How the Script Works

1. The script reads files from the **data directory**
2. Files are compressed using `tar`
3. Backup file is stored in the **backups directory**
4. Backup is uploaded to **AWS S3**
5. Backup activity is recorded in **log files**
6. Old backups (older than 7 days) are automatically deleted

---

## Example Backup Command

```bash
tar -czf backup.tar.gz data/
```

This command compresses the `data` directory into a `.tar.gz` backup file.

---

## Cron Automation

The script can be scheduled using cron for automatic execution.

Example cron job:

```
0 11 * * * /home/hemanthhk/hybrid-cloud-backup/backup.sh
```

This runs the backup **every day at 11:00 AM**.

---

## AWS S3 Integration

Backups are uploaded to an AWS S3 bucket using the AWS CLI command:

```bash
aws s3 cp backup.tar.gz s3://your-bucket-name/
```

This ensures that backups are stored both **locally and in the cloud**.

---

## Author

Hemanth Kumar HV

