#!/bin/bash

service mariadb start

# wait for the service to start
sleep 7

# Create the database that wp will use
mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"

# give all privileges on wp-db
# to wp-db-user ('%' means he can connect from any host)
# finally sets the wp-db-user password
mariadb -e "GRANT ALL ON $WP_DB_NAME.* \
        TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';"

# changes the password of root to DB_ROOT_PW
# this is root@localhost (connection comes from the MariaDB container itself)
mariadb -e "ALTER USER '$DB_ROOT_USER'@'localhost' IDENTIFIED BY '$DB_ROOT_PW';"

# Stop the service for now
mysqladmin -u $DB_ROOT_USER -p$DB_ROOT_PW shutdown

# make the service the main process (ie PID 1)
exec mysqld_safe
