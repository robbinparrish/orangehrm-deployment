#!/bin/bash

# Path where the OrangeHRM deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
ORANGEHRM_DEPLOYMENT_DIR="${HOME}/orangehrm-deployment"
ORANGEHRM_DEPLOYMENT_BACKUP_PATH="${HOME}/orangehrm-deployment-backup"
MARIA_DB_PASSWORD="YOUR_MARIADB_PASSWORD"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
ORANGEHRM_DEPLOYMENT_BACKUP_DIR="${ORANGEHRM_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${ORANGEHRM_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${ORANGEHRM_DEPLOYMENT_BACKUP_DIR}"
cp -av ./orangehrm-data/data "${ORANGEHRM_DEPLOYMENT_BACKUP_DIR}"/

# Create backup.
mkdir -p ./maria-db/backups
chown -R 1000:1000 ./maria-db/backups
docker-compose exec -it mariadb /usr/bin/mariadb-dump -u root --password="${MARIA_DB_PASSWORD}" --all-databases > ./maria-db/backups/maria-db-backup.sql
mv -fv ./maria-db/backups/maria-db-backup.sql "${ORANGEHRM_DEPLOYMENT_BACKUP_DIR}"/
sync

# Compress the backup.
cd "${ORANGEHRM_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync
