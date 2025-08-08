# Docker Compose : MariaDB + phpMyAdmin

Ce dossier suit **exactement** la consigne du cours “BDD et client sql” :
- un conteneur **MariaDB** basé sur `mariadb:lts-ubi9` (nom du conteneur `maria-db`),
- un conteneur **phpMyAdmin** (`phpmyadmin/phpmyadmin:5.2.2`) pour administrer la BDD.

## Arborescence
```
.
├─ docker-compose.yml
├─ .env
└─ db/
   └─ dump/
      └─ 001-init.sql
```

## 1) Préparer
Vérifiez/éditez `.env` si besoin (nom de base, mot de passe, etc.).  
Par défaut :
- Base : `demo_db`
- Mot de passe root : `supersecuredpassword`
- Dossier de dump : `./db/dump`

## 2) Lancer
```bash
docker compose up -d
docker compose ps
```
Cela démarre :
- MariaDB sur le port **9806** (mappé vers 3306 du conteneur),
- phpMyAdmin sur **http://localhost:9080**.

## 3) Se connecter à phpMyAdmin
- URL : http://localhost:9080
- Serveur : `maria-db` (c’est le **nom du conteneur**, pas une IP)
- Utilisateur : `root`
- Mot de passe : valeur de `MARIADB_ROOT_PASSWORD` (voir `.env`(```supersecuredpassword```))

## 4) Notes sur les volumes / init
Les scripts SQL placés dans `db/dump/` sont exécutés **au premier démarrage** du conteneur MariaDB (ordre alphanumérique).  
Ici `001-init.sql` crée `demo_db` + table `users` + quelques entrées.

## 5) Arrêter et nettoyer
```bash
# Arrêt des conteneurs
docker compose down

# Réinitialiser (supprime aussi volumes = réinstalle la base à froid)
docker compose down -v
```

## 6) Pourquoi ces ports ?
- `9806:3306` → permet d’accéder à MariaDB depuis l’hôte (clients SQL).
- `9080:80` → expose l’interface web de phpMyAdmin.

