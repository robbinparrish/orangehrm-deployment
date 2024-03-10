## Backup and Restore.

### Backup OrangeHRM instance.
Since OrangeHRM stores all data in the `mariadb` database so we will need to backup the whole database.

All backups are stored in `./maria-db/backups` directory.  
Along with the backup following directories must be `manually` backed up.  
```
./orangehrm-data/data
```

For backup of mariadb database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./maria-db/backups
chown -R 1000:1000 ./maria-db/backups
```

#### Triggering Backup.
Run following command to trigger the backup.
This will create a `.sql` file containing database.
```bash
docker-compose exec -it mariadb /usr/bin/mariadb-dump -u root --password=YOUR_MARIADB_PASSWORD --all-databases > ./maria-db/backups/maria-db-backup.sql
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working OrangeHRM instance.

#### Restore.
- Stop the OrangeHRM container.
```bash
docker-compose down orangehrm
```

- Restore/Copy the configuration files.
```
First remove existing directories.
./orangehrm-data/data

Now copy backed up directories.
Copy data to ./orangehrm-data/data
```

- Copy the mariadb backup file for restore.
```
Copy maria-db-backup.sql file to ./maria-db/backups directory.
```

- Restore the mariadb backup.
```bash
docker-compose exec -T mariadb /usr/bin/mariadb -u root --password=YOUR_MARIADB_PASSWORD < ./maria-db/backups/maria-db-backup.sql
```

### Stop all the container.
```
docker-compose down
```

### Starting the container.
```
docker-compose up -d
```

### Checking the container logs.
```
docker-compose logs -f
```

#### Once Backup is restored login to the OrangeHRM instance and verify that all configurations and data are restored.

[Automatic Backup Setup](./automatic-backup/README.md)

