DROP DATABASE IF EXISTS parc_attractions;
CREATE DATABASE parc_attractions CHARACTER SET utf8mb4;
USE parc_attractions;
 
CREATE TABLE visiteur(
   id_visiteur INT AUTO_INCREMENT,
   nom_visiteur VARCHAR(50) NOT NULL,
   prenom_visiteur VARCHAR(50) NOT NULL,
   date_naissance DATE,
   email VARCHAR(100),
   PRIMARY KEY(id_visiteur)
);
 
CREATE TABLE zone(
   id_zone INT AUTO_INCREMENT,
   nom_zone VARCHAR(50) NOT NULL,
   theme_zone VARCHAR(50),
   PRIMARY KEY(id_zone)
);
 
CREATE TABLE attraction(
   id_attraction INT AUTO_INCREMENT,
   nom_attraction VARCHAR(50) NOT NULL,
   taille_minimale INT,
   capacite INT,
   statut VARCHAR(50),
   id_zone INT NOT NULL,
   PRIMARY KEY(id_attraction),
   FOREIGN KEY(id_zone) REFERENCES zone(id_zone)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE spectacle(
   id_spectacle INT AUTO_INCREMENT,
   titre_spectacle VARCHAR(100) NOT NULL,
   duree_spectacle INT,
   id_zone INT NOT NULL,
   PRIMARY KEY(id_spectacle),
   FOREIGN KEY(id_zone) REFERENCES zone(id_zone)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE representation(
   id_spectacle INT,
   num_representation INT,
   date_heure_representation DATETIME NOT NULL,
   nombre_places INT,
   PRIMARY KEY(id_spectacle, num_representation),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE restaurant(
   id_restaurant INT AUTO_INCREMENT,
   nom_restaurant VARCHAR(50) NOT NULL,
   type_cuisine VARCHAR(30),
   id_zone INT NOT NULL,
   PRIMARY KEY(id_restaurant),
   FOREIGN KEY(id_zone) REFERENCES zone(id_zone)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE addition(
   id_addition INT AUTO_INCREMENT,
   montant_addition DECIMAL(8,2) NOT NULL,
   id_restaurant INT NOT NULL,
   id_visiteur INT NOT NULL,
   PRIMARY KEY(id_addition),
   FOREIGN KEY(id_restaurant) REFERENCES restaurant(id_restaurant)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_visiteur) REFERENCES visiteur(id_visiteur)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE hotel(
   id_hotel INT AUTO_INCREMENT,
   nom_hotel VARCHAR(50) NOT NULL,
   nombre_etoiles INT,
   PRIMARY KEY(id_hotel)
);
 
CREATE TABLE type_chambre(
   id_type_chambre INT AUTO_INCREMENT,
   type_chambre VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_type_chambre)
);
 
CREATE TABLE employe(
   id_employe INT AUTO_INCREMENT,
   nom_employe VARCHAR(50) NOT NULL,
   prenom_employe VARCHAR(50) NOT NULL,
   fonction VARCHAR(50),
   date_embauche DATE,
   id_superieur INT,                       
   id_zone INT NOT NULL,
   PRIMARY KEY(id_employe),
   FOREIGN KEY(id_superieur) REFERENCES employe(id_employe)
      ON UPDATE CASCADE ON DELETE SET NULL,
   FOREIGN KEY(id_zone) REFERENCES zone(id_zone)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE tarif(
   id_tarif INT AUTO_INCREMENT,
   type_billet VARCHAR(50) NOT NULL,
   categorie_tarifaire VARCHAR(50) NOT NULL,
   prix_billet DECIMAL(7,2) NOT NULL,
   PRIMARY KEY(id_tarif)
);
 
CREATE TABLE reservation_hotel(
   id_reservation INT AUTO_INCREMENT,
   date_arrivee DATE NOT NULL,
   date_depart DATE NOT NULL,
   id_type_chambre INT NOT NULL,
   id_hotel INT NOT NULL,
   id_visiteur INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_type_chambre) REFERENCES type_chambre(id_type_chambre)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_visiteur) REFERENCES visiteur(id_visiteur)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE billet(
   num_billet INT AUTO_INCREMENT,
   date_validite DATE NOT NULL,
   id_tarif INT NOT NULL,
   id_visiteur INT NOT NULL,
   PRIMARY KEY(num_billet),
   FOREIGN KEY(id_tarif) REFERENCES tarif(id_tarif)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_visiteur) REFERENCES visiteur(id_visiteur)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE passage(
   id_passage INT AUTO_INCREMENT,
   temps_attente INT,
   date_heure DATETIME NOT NULL,
   id_attraction INT NOT NULL,
   num_billet INT NOT NULL,
   PRIMARY KEY(id_passage),
   FOREIGN KEY(id_attraction) REFERENCES attraction(id_attraction)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(num_billet) REFERENCES billet(num_billet)
      ON UPDATE CASCADE ON DELETE CASCADE
);
 
CREATE TABLE propose(
   id_type_chambre INT,
   id_hotel INT,
   prix_nuit DECIMAL(7,2) NOT NULL,
   PRIMARY KEY(id_type_chambre, id_hotel),
   FOREIGN KEY(id_type_chambre) REFERENCES type_chambre(id_type_chambre)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel)
      ON UPDATE CASCADE ON DELETE CASCADE
);