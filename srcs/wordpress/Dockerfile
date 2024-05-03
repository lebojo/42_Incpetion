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

# Définition du répertoire de travail
WORKDIR /var/www/html/

# Attribution des permissions
RUN adduser -D -G www-data www-data && \
	chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html && \
	chown -R www-data:www-data /run/php && \
	chown -R www-data:www-data /usr/local/bin && \
	chown -R www-data:www-data /etc/php81/php-fpm.d && \
	chown -R www-data:www-data /var/log/php81

USER www-data

CMD ["sh", "/usr/local/bin/create_wordpress.sh"]