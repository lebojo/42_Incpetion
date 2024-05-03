#!/bin/sh
set -e

# echo "DB_HOST: $DB_HOST"
# echo "DB_USER: $DB_USER"
# echo "DB_PASS: $DB_PASS"


chown -R www-data:www-data /var/www/html
exec "$@"

if ! test -f /var/www/html/wp-config.php; then
	wp core download
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=$DB_PREFIX
	wp core install --url=$WP_URL --title="$WP_TITLE" --admin_name=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_MAIL
fi

php-fpm81 -F