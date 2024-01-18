#!/bin/sh

if ! wp --path=/var/www/ user list --field=user_login | /bin/grep -q "${DB_USERNAME}"; then

    wp core install --path=/var/www/ --title="Vguidoni-42" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email=host@mail.it --url=vguidoni.42.fr --locale=it_IT

    wp user create "${WP_USERNAME}" user@mail.it --path=/var/www/ --role=author --user_pass="${WP_USER_PASS}"

    # Controllo per vedere se ho creato l'utente
    if [ $? -ne 0 ]; then
        echo "Utente non creato."
        exit 1
    fi

    wp plugin install wp-redis --activate --path=/var/www/

    wp language core install it_IT --path=/var/www/

    wp site switch-language it_IT --path=/var/www/

    wp option update WPLANG it_IT --path=/var/www

#####

    HOME_PAGE_ID=$(wp post create --post_type=page --post_title="Benvenuto su Inception di Vguidoni" --post_content="Questo progetto mette seriamente alla prova la pazienza, dove niente funziona mai come dovrebbe." --porcelain --path=/var/www/)
    wp option update show_on_front page --path=/var/www/
    wp option update page_on_front $HOME_PAGE_ID --path=/var/www/

#######
fi

php-fpm81 --nodaemonize