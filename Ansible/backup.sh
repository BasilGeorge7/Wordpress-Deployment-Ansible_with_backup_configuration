#!/bin/bash

DATE=$(date +%F-%H-%M)
BACKUP_DIR="/backup"
WEB_DIR="/var/www/html"
DB_NAME="{{ database }}"
DB_USER="{{ admin }}"
DB_PASS="{{admin_password}}"

mkdir -p $BACKUP_DIR
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db-$DATE.sql
tar -czf $BACKUP_DIR/webfiles-$DATE.tar.gz $WEB_DIR