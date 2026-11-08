
USE parc_attractions;
 

 
-- RG 1 : on connaît l'adresse e-mail de chaque visiteur
ALTER TABLE visiteur MODIFY email VARCHAR(100) NOT NULL;
 
-- RG 8 : chaque zone a un thème
ALTER TABLE zone MODIFY theme_zone VARCHAR(50) NOT NULL;
 
-- RG 11 : chaque attraction a une taille minimale, une capacité et un statut
ALTER TABLE attraction MODIFY taille_minimale INT NOT NULL;
ALTER TABLE attraction MODIFY capacite INT NOT NULL;
ALTER TABLE attraction MODIFY statut VARCHAR(50) NOT NULL;
 
-- RG 12 : le temps d'attente est enregistré à chaque passage
ALTER TABLE passage MODIFY temps_attente INT NOT NULL;
 
-- RG 15 : chaque spectacle a une durée
ALTER TABLE spectacle MODIFY duree_spectacle INT NOT NULL;
 
-- RG 17 : chaque représentation a un nombre de places
ALTER TABLE representation MODIFY nombre_places INT NOT NULL;
 
-- RG 18 : chaque restaurant a un type de cuisine
ALTER TABLE restaurant MODIFY type_cuisine VARCHAR(30) NOT NULL;
 
-- RG 20 : chaque hôtel a un nombre d'étoiles
ALTER TABLE hotel MODIFY nombre_etoiles INT NOT NULL;
 
-- RG 24 : chaque employé a une fonction et une date d'embauche
ALTER TABLE employe MODIFY fonction VARCHAR(50) NOT NULL;
ALTER TABLE employe MODIFY date_embauche DATE NOT NULL;
  
-- RG 8 : chaque zone a un nom unique
ALTER TABLE zone ADD CONSTRAINT uq_zone_nom UNIQUE (nom_zone);
 
-- Une adresse e-mail correspond à un seul visiteur
ALTER TABLE visiteur ADD CONSTRAINT uq_visiteur_email UNIQUE (email);
 
-- Un nom d'hôtel et un libellé de type de chambre ne sont pas répétés
ALTER TABLE hotel ADD CONSTRAINT uq_hotel_nom UNIQUE (nom_hotel);
ALTER TABLE type_chambre ADD CONSTRAINT uq_type_chambre UNIQUE (type_chambre);
 
-- RG 5 : combinaison d'attributs -> un seul prix par
-- (type de billet, catégorie tarifaire)
ALTER TABLE tarif ADD CONSTRAINT uq_tarif UNIQUE (type_billet, categorie_tarifaire);
 
-- RG 16 : combinaison d'attributs -> un spectacle n'a pas deux
-- représentations à la même date et heure
ALTER TABLE representation ADD CONSTRAINT uq_representation
   UNIQUE (id_spectacle, date_heure_representation);
 
-- RG 11 : statut ouverte, fermée ou en maintenance
ALTER TABLE attraction ADD CONSTRAINT ck_statut
   CHECK (statut IN ('ouverte', 'fermée', 'maintenance'));
 
-- RG 5 : catégorie tarifaire enfant, adulte ou senior
ALTER TABLE tarif ADD CONSTRAINT ck_categorie
   CHECK (categorie_tarifaire IN ('enfant', 'adulte', 'senior'));
 
-- RG 20 : un hôtel a entre 1 et 5 étoiles
ALTER TABLE hotel ADD CONSTRAINT ck_etoiles
   CHECK (nombre_etoiles BETWEEN 1 AND 5);
 
-- RG 11 : taille minimale en cm (0 = pas de restriction)
ALTER TABLE attraction ADD CONSTRAINT ck_taille
   CHECK (taille_minimale BETWEEN 0 AND 200);
 
-- RG 12 : temps d'attente en minutes, au plus 5 heures
ALTER TABLE passage ADD CONSTRAINT ck_attente
   CHECK (temps_attente BETWEEN 0 AND 300);
 
-- RG 15 : durée d'un spectacle en minutes, au plus 5 heures
ALTER TABLE spectacle ADD CONSTRAINT ck_duree
   CHECK (duree_spectacle BETWEEN 1 AND 300);
 
-- RG 11 : nombre de personnes par tour
ALTER TABLE attraction ADD CONSTRAINT ck_capacite CHECK (capacite > 0);
 
-- RG 17 : nombre de places d'une représentation
ALTER TABLE representation ADD CONSTRAINT ck_places CHECK (nombre_places > 0);
 
-- RG 19 : montant d'une addition
ALTER TABLE addition ADD CONSTRAINT ck_montant CHECK (montant_addition > 0);
 
-- RG 22 : prix d'une nuit
ALTER TABLE propose ADD CONSTRAINT ck_prix_nuit CHECK (prix_nuit > 0);
 
-- RG 5 : prix d'un billet (0 possible : gratuit pour les tout-petits)
ALTER TABLE tarif ADD CONSTRAINT ck_prix_billet CHECK (prix_billet >= 0);
 
-- Dates plausibles (>=)
ALTER TABLE visiteur ADD CONSTRAINT ck_naissance
   CHECK (date_naissance >= '1900-01-01');

-- RG 23 : la date de départ est après la date d'arrivée
ALTER TABLE reservation_hotel ADD CONSTRAINT ck_dates_sejour
   CHECK (date_depart > date_arrivee);
 
-- Format d'une donnée : l'e-mail contient un @ et un point
-- ('_' = un caractère quelconque, '%' = zéro ou plusieurs caractères)
ALTER TABLE visiteur ADD CONSTRAINT ck_email
   CHECK (email LIKE '%_@_%._%');
  
-- RG 21-23 : on ne peut réserver dans un hôtel qu'un type de chambre que
-- cet hôtel propose -> le couple (type de chambre, hôtel) doit exister
-- dans la table propose
ALTER TABLE reservation_hotel ADD CONSTRAINT fk_reservation_propose
   FOREIGN KEY (id_type_chambre, id_hotel)
   REFERENCES propose(id_type_chambre, id_hotel)
   ON DELETE CASCADE
   ON UPDATE CASCADE;
   
   