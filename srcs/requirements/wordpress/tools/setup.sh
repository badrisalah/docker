#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# --allow-root is required because this script runs as root inside the container.
wp core download --allow-root

# wp config create creates the WordPress configuration file: /var/www/html/wp-config.php
# This file contains the information WordPress needs to
# connect to the MariaDB database.

wp config create \
        --dbname=$WP_DB_NAME \
        --dbuser=$WP_DB_USER \
        --dbpass=$WP_DB_PASSWORD \
        --dbhost=$WP_DB_HOST \
        --allow-root

# now we have the config.php file 
# "wp core install" performs the actual WordPress
# installation
# It creates the WordPress database tables and creates the
# administrator account

wp core install \
        --url="$WP_URL" \
        --title="Inception" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PW \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

# create the second user (not admin)
wp user create \
        $WP_AUTHOR_USER \
        $WP_AUTHOR_EMAIL \
        --user_pass=$WP_AUTHOR_PW \
        --role=author \
        --allow-root

# PHP-FPM is the process that actually executes PHP code
# -F means 'Foreground'
# Make PHP-FPM the container's main process and keep it running in the foreground
exec php-fpm8.2 -F
