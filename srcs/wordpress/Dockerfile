FROM	alpine:3.18

RUN	apk update && apk upgrade \
		&& apk --no-cache add bash curl wget tar php81 php81-gd php81-fpm php81-phar php81-mysqli php81-mbstring mysql-client \
		&& addgroup -S phpfpm && adduser -S phpfpm -G phpfpm \
		&& mkdir www && chown phpfpm:phpfpm www \
		&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod a+x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp


USER	root

COPY	./www.conf /etc/php81/php-fpm.d/
COPY	./wp_setup.sh /tmp/wp_setup.sh

RUN		chmod +x /tmp/wp_setup.sh

EXPOSE	9000

ENTRYPOINT ["/tmp/wp_setup.sh"]

CMD ["/usr/sbin/php-fpm81", "-F"]