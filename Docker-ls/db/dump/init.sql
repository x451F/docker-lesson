-- Création de la base de données
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

-- Création de la table utilisateurs
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_inscription DATE NOT NULL
);

-- Création de la table produits
CREATE TABLE IF NOT EXISTS produits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);

-- Création de la table commandes
CREATE TABLE IF NOT EXISTS commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    date_commande DATE NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- Création de la table commande_produits (relation commandes-produits)
CREATE TABLE IF NOT EXISTS commande_produits (
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (commande_id, produit_id),
    FOREIGN KEY (commande_id) REFERENCES commandes(id),
    FOREIGN KEY (produit_id) REFERENCES produits(id)
);