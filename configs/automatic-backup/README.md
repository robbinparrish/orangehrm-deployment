# Perform an automatic backup of OrangeHRM Deployment.

## Copy backup script.
```bash
cp -a orangehrm-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/orangehrm-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/orangehrm-deployment-backup.sh`
```
ORANGEHRM_DEPLOYMENT_DIR="${HOME}/orangehrm-deployment"
ORANGEHRM_DEPLOYMENT_BACKUP_PATH="${HOME}/orangehrm-deployment-backup"
MARIA_DB_PASSWORD="YOUR_MARIADB_PASSWORD"
```

## Copy systemd unit and timer files.
```bash
cp orangehrm-deployment-backup.timer orangehrm-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable --now orangehrm-deployment-backup.timer
```