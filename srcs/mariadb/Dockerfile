# On importe alpine
FROM alpine:3.18

# Installer les dépendances nécessaires
RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc

RUN mkdir -p /tmp/

# Copier la configuration de MariaDB
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY entrypoint.sh /tmp/entrypoint.sh
COPY sql_setup.sh /tmp/sql_setup.sh

# Exposer le port nécessaire
EXPOSE 3306

RUN chmod +x /tmp/entrypoint.sh && \
	chmod +x /tmp/sql_setup.sh

# Démarrer le service MariaDB
CMD ["sh", "/tmp/entrypoint.sh"]