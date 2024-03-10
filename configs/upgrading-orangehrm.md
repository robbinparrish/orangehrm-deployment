## Upgrading OrangeHRM to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://hub.docker.com/r/orangehrm/orangehrm/tags
- https://hub.docker.com/_/mariadb/tags
- https://hub.docker.com/_/nginx/tags

Once the latest released version is identified we can update the corresponding version in the [docker-compose.yml](./../docker-compose.yml) file.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```
