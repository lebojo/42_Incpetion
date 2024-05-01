-- Creation de la database
CREATE DATABASE IF NOT EXISTS db;

-- On dit que c'est celle la qu'on veut
USE db;

-- Creation des tables
CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Creation de l'utilisateur
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON `db`.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;