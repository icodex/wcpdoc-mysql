#!/bin/bash
echo "====>auto run mysql script..."
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
SET @@global.sql_mode= '';
flush privileges;
EOF
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF
create database if not exists $MYSQL_DATABASE;
use $MYSQL_DATABASE;
source $WORK_PATH/$DB_FILE;
grant all privileges on $MYSQL_DATABASE.* to 'root'@'%';
flush privileges;
EOF
