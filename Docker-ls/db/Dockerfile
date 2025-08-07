# Image créée à partir d'une image Mariadb (changer les ??? par une image trouvée sur Docker Hub)
FROM mariadb:lts-ubi9

# Défintion du mot de passe pour l'utilisateur "root"
ENV MARIADB_ROOT_PASSWORD=ultrasupersecuredpassword

# Copie d'un fichier de configuration custom
COPY ./my.cnf /etc/mysql/conf.d/my.cnf
COPY ./dump /docker-entrypoint-initdb.d
