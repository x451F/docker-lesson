# Exercice : Configuration d'une image de base de données (MariaDB)


## Contenu du projet
- `Dockerfile` : basé sur `mariadb:lts-ubi9`, copie `my.cnf` et le dossier `dump/`.
- `my.cnf` : paramètres de base (UTF-8, InnoDB, mysql_native_password).
- `dump/001-init.sql` : crée la base `demo_db` et une table `users` avec quelques enregistrements.

## 1) Construire l'image
```bash
docker build -t my-mariadb:exercise .
docker image ls | grep my-mariadb
```

## 2) Lancer un conteneur (avec mappage de port)
```bash
docker run --name mariadb-ex --rm -p 127.0.0.1:9806:3306/tcp my-mariadb:exercise
```

> Connexion : `host=localhost`, `port=9806`, `user=root`, `password=ultrasupersecuredpassword`.

## 3) Vérifier le conteneur
```bash
docker container ls -a
```

## 4) Se connecter via un client (ex: DBeaver / HeidiSQL)
Créez une nouvelle connexion MariaDB :
```
Hôte : localhost
Port : 9806
Utilisateur : root
Mot de passe : ultrasupersecuredpassword
Base : demo_db (optionnel)
```

## 5) Arrêter / démarrer / supprimer
```bash
# Arrêter (si lancé en arrière-plan)
docker container stop mariadb-ex

# Redémarrer
docker container start mariadb-ex

# Supprimer le conteneur
docker container rm mariadb-ex

# Supprimer l'image
docker image rm my-mariadb:exercise
```
