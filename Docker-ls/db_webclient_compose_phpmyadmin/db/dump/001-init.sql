-- 001-init.sql — création minimale pour la démo
DROP DATABASE IF EXISTS demo_db;
CREATE DATABASE demo_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE demo_db;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(64) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username) VALUES ('alice'), ('bob'), ('charlie');
