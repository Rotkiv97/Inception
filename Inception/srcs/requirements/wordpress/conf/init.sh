#!/bin/sh

if ! wp --path=/var/www/ user list --field=user_login | /bin/grep -q "${DB_USERNAME}"; then

wp core install --path=/var/www/ --title=Vguidoni-42 --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email=sample@mail.it --url=vguidoni.42.fr

wp user create "${WP_USERNAME}" sample2@mail.it --path=/var/www/ --role=author --user_pass="${WP_USER_PASS}"

wp plugin install wp-redis --activate --path=/var/www/

fi

php-fpm81 --nodaemonize