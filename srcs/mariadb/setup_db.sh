#!/bin/bash

set -x


mkdir -p /var/lib/mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld

if [ ! -e "/var/lib/mysql/$DB_NAME" ]
then
    mariadb-install-db --datadir=/var/lib/mysql --user=mysql
    mysqld --user=mysql --datadir=/var/lib/mysql &
    sleep 4
    mariadb -e "CREATE DATABASE $DB_NAME ;"
    mariadb -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
FLUSH PRIVILEGES;
    mariadb -e "FLUSH PRIVILEGES;"
    mysqladmin shutdown

else
    echo "Database already present"
fi

exec "$@"