#!/bin/bash

set -e


mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/$WP_DB_NAME" ]; then

    mysqld_safe --skip-networking --user=mysql &

    until mariadbadmin ping --silent; do
        sleep 1
    done

    mariadb << EOF
CREATE DATABASE IF NOT EXISTS $WP_DB_NAME
    DEFAULT CHARACTER SET utf8
    COLLATE utf8_unicode_ci;

CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';

GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';

ALTER USER '$DB_ROOT_USER'@'localhost'
    IDENTIFIED BY '$DB_ROOT_PW';

FLUSH PRIVILEGES;
EOF

    mysqladmin -u "$DB_ROOT_USER" -p"$DB_ROOT_PW" shutdown

fi

exec mariadbd --bind-address=0.0.0.0 --user=mysql

