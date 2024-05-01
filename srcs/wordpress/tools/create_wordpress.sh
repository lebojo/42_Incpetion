#!/bin/sh
set -e

# echo "DB_HOST: $DB_HOST"
# echo "DB_USER: $DB_USER"
# echo "DB_PASS: $DB_PASS"

# until mysql -h"$DB_HOST" -P3306 -u"$DB_USER" -p"$DB_PASS" -e 'SELECT 1'; do
#   echo "Waiting for db"
#   sleep 1
# done

# if [ ! -f "/var/www/html/wp-config.php" ]; then
#     wp core download
#     wp config create --skip-check
#     wp core install --url=$WP_URL --title="$WP_TITLE" --admin_name=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_MAIL
#     # wp user create ann ann@example.com
# fi

php-fpm81 -F