#!/bin/sh
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 5
./tmp/sql_setup.sh