# Dockerfile — image MariaDB basée sur l'image officielle UBI9 LTS
# Voir les tags : mariadb:lts-ubi9
FROM mariadb:lts-ubi9

# Mot de passe root (utilisation locale uniquement)
ENV MARIADB_ROOT_PASSWORD=ultrasupersecuredpassword

# Copie du fichier de configuration et des scripts d'initialisation
COPY ./my.cnf /etc/mysql/conf.d/my.cnf
COPY ./dump /docker-entrypoint-initdb.d
