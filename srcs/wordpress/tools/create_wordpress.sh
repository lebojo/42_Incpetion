#!/bin/sh
set -e

# echo "DB_HOST: $DB_HOST"
# echo "DB_USER: $DB_USER"
# echo "DB_PASS: $DB_PASS"


if [ ! -f /var/www/html/www-data-config.php ]; then
	www-data core download
	www-data config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=$DB_PREFIX
	www-data core install --url=$www-data_URL --title="$www-data_TITLE" --admin_name=$www-data_ADMIN --admin_password=$www-data_PASS --admin_email=$www-data_MAIL
else
	echo "WordPress already installed"
fi


whoami
pwd
ls -l /var/www/html

php-fpm81 -F