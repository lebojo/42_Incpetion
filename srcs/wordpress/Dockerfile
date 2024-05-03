FROM alpine:3.18

RUN apk update && apk add --no-cache \
    wget \
    curl \
    bash \
    php \
    php-cgi \
    php-mysqli \
    php-fpm \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
	php-phar \
	mariadb-client \
    && rm -rf /var/cache/apk/*

# Installation de wp-cli et déplacement vers le répertoire /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copie du fichier .conf dans le répertoire approprié
COPY ./www.conf /etc/php81/php-fpm.d/www.conf

# Création du répertoire pour permettre le démarrage de PHP
RUN mkdir -p /run/php

# Copie du script et attribution des permissions pour son exécution
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

# Exposition du port 9000 utilisé par PHP-FPM
EXPOSE 9000

# Création de l'utilisateur www-data
RUN adduser -D -G www-data www-data

# Attribution des permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /run/php
RUN chown -R www-data:www-data /usr/local/bin
RUN chown -R www-data:www-data /etc/php81/php-fpm.d
RUN chown -R www-data:www-data /var/log/php81

USER www-data

# Définition du répertoire de travail
WORKDIR /var/www/html/

CMD ["sh", "/usr/local/bin/create_wordpress.sh"]