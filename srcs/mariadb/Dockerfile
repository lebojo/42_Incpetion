# On importe alpine
FROM alpine:3.18

# Installer les dépendances nécessaires
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# Créer les répertoires nécessaires
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copier la configuration de MariaDB
COPY 50-server.cnf /etc/my.cnf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql

# Exposer le port nécessaire
EXPOSE 3306


# Démarrer le service MariaDB
CMD ["mysqld", "--user=mysql", "--init-file=/etc/mysql/init.sql"]
