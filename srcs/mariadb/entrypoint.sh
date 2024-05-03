#!/bin/sh
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 5
mysqld --datadir='/var/lib/mysql' --user=root --init-file=/tmp/sql_setup.sh