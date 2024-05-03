# On importe alpine
FROM alpine:3.18

# Installer les dépendances nécessaires
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# Copier la configuration de MariaDB
COPY my.cnf /etc/mysql/my.cnf

# Copier les scripts d'initialisation de la base de données
COPY init_db.sql /docker-entrypoint-initdb.d/init_db.sql

# Exposer le port nécessaire
EXPOSE 3306

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN chown -R mysql:mysql /var/lib/mysql

RUN chmod 777 /var/lib/mysql


# Démarrer le service MariaDB
CMD ["sh", "-c", "mysqld_safe --datadir='/var/lib/mysql' & sleep 1 && mysql -uroot < /docker-entrypoint-initdb.d/init_db.sql && tail -f /dev/null"]