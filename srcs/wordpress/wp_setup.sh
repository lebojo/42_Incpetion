#!/bin/sh
set -e

# echo "DB_HOST: $DB_HOST"
# echo "DB_USER: $DB_USER"
# echo "DB_PASS: $DB_PASS"

until mysql -h"$DB_HOST" -P3306 -u"$DB_USER" -p"$DB_PASS" -e 'SELECT 1'; do
  sleep 1
done

if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --dbprefix="$DB_PREFIX"
	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email=$WP_ADMIN_EMAIL
	echo "WordPress installed"
else
	echo "WordPress already installed"
fi

php-fpm81 -F