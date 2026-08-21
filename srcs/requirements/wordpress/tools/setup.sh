#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

if [ ! -f wp-config.php ]; then

    if [ ! -f wp-load.php ]; then
        curl -O https://wordpress.org/latest.tar.gz
        tar -xzf latest.tar.gz --strip-components=1
        rm latest.tar.gz
    fi

    echo "Waiting for MariaDB..."

    until mariadb \
        -h mariadb \
        -u "$WP_DB_USER" \
        -p"$WP_DB_PASSWORD" \
        "$WP_DB_NAME" \
        -e "SELECT 1" >/dev/null 2>&1
    do
        sleep 2
    done

    wp config create \
        --dbname="$WP_DB_NAME" \
        --dbuser="$WP_DB_USER" \
        --dbpass="$WP_DB_PASSWORD" \
        --dbhost="mariadb:3306" \
        --allow-root

    wp core install \
        --url="https://sabadri.42.fr" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root

    chown -R www-data:www-data /var/www/html
fi

exec php-fpm8.2 -F
