#!/bin/bash
# Kyle Vandoremalen - March 2025
# Create a tar ball of service config files.
# Replace apache related names with your own service files to customize
# Note: The backups/<service> directory must already exist

BACKUP_DIRECTORY="/backups/apache"
TAR_NAME="apache_service_backup.tar.gz"
BACKED_UP_FILES=(
	"/etc/httpd/conf"
	"/etc/httpd/conf.d"
	"/var/www/html"
	"/usr/lib/systemd/system/httpd.service"
)

# Create a tarball
echo "Creating tarball"
tar -czf "$BACKUP_DIRECTORY/$TAR_NAME" "${BACKED_UP_FILES[@]}"

echo "Backup complete!"
