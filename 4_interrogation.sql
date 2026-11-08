USE parc_attractions;

-- Q1 : attractions fermées ou en maintenance
SELECT nom_attraction, statut
FROM attraction
WHERE statut IN ('fermée', 'maintenance')
ORDER BY statut, nom_attraction;

-- Q2 : types de cuisine proposés dans le parc 
SELECT DISTINCT type_cuisine
FROM restaurant
ORDER BY type_cuisine;

-- Q3 : attractions accessibles aux enfants 
SELECT nom_attraction, taille_minimale
FROM attraction
WHERE taille_minimale BETWEEN 0 AND 120
ORDER BY taille_minimale DESC, nom_attraction;

-- Q4 : visiteurs avec une adresse gmail 
SELECT nom_visiteur, prenom_visiteur, email
FROM visiteur
WHERE email LIKE '%@gmail.com'
ORDER BY nom_visiteur;

-- Q5 : passages de l'été avec plus d'une heure d'attente
SELECT id_attraction, date_heure, temps_attente
FROM passage
WHERE date_heure BETWEEN '2026-07-01' AND '2026-08-31 23:59:59'
  AND temps_attente > 60
ORDER BY temps_attente DESC;

-- Q6 : nombre d'employés par fonction
SELECT fonction, COUNT(*) AS nb_employes
FROM employe
GROUP BY fonction
ORDER BY nb_employes DESC;

-- Q7 : nombre de billets vendus et recette par type de billet
SELECT t.type_billet, COUNT(*) AS nb_billets, SUM(t.prix_billet) AS recette
FROM billet b
JOIN tarif t ON b.id_tarif = t.id_tarif
GROUP BY t.type_billet
ORDER BY recette DESC;

-- Q8 : attractions les plus fréquentées 
SELECT id_attraction, COUNT(*) AS nb_passages
FROM passage
GROUP BY id_attraction
HAVING COUNT(*) > 12
ORDER BY nb_passages DESC; 

-- Q9 : restaurants ayant fait plus de 300 € de chiffre d'affaires
SELECT id_restaurant, COUNT(*) AS nb_additions, SUM(montant_addition) AS chiffre_affaires
FROM addition
GROUP BY id_restaurant
HAVING SUM(montant_addition) > 300
ORDER BY chiffre_affaires DESC;

-- Q10 : prix minimum, maximum et moyen d'une nuit dans chaque hôtel
SELECT id_hotel, MIN(prix_nuit) AS prix_min, MAX(prix_nuit) AS prix_max, ROUND(AVG(prix_nuit), 2) AS prix_moyen
FROM propose
GROUP BY id_hotel;

-- Q11 : attractions avec le nom de leur zone
SELECT z.nom_zone, a.nom_attraction, a.statut
FROM attraction a
INNER JOIN zone z ON a.id_zone = z.id_zone
ORDER BY z.nom_zone, a.nom_attraction;

-- Q12 fréquentation de chaque zone (nombre de passages)
SELECT z.nom_zone, COUNT(p.id_passage) AS nb_passages
FROM zone z
JOIN attraction a ON a.id_zone = z.id_zone
JOIN passage p ON p.id_attraction = a.id_attraction
GROUP BY z.nom_zone
ORDER BY nb_passages DESC;

-- Q13 : nombre de réservations par hôtel, y compris les hôtels sans réservation
SELECT h.nom_hotel, h.nombre_etoiles, COUNT(r.id_reservation) AS nb_reservations
FROM hotel h
LEFT JOIN reservation_hotel r ON r.id_hotel = h.id_hotel
GROUP BY h.id_hotel, h.nom_hotel, h.nombre_etoiles
ORDER BY nb_reservations DESC;

-- Q14 : employés avec le nom de leur supérieur
SELECT e.nom_employe, e.prenom_employe, e.fonction,
       s.nom_employe AS nom_superieur, s.prenom_employe AS prenom_superieur
FROM employe e
LEFT JOIN employe s ON e.id_superieur = s.id_employe
ORDER BY s.nom_employe, e.nom_employe;
 
-- Q15 : coût de chaque séjour à l'hôtel (nombre de nuits x prix d'une nuit)
SELECT v.nom_visiteur, v.prenom_visiteur, h.nom_hotel, tc.type_chambre,
       DATEDIFF(r.date_depart, r.date_arrivee) AS nb_nuits,
       DATEDIFF(r.date_depart, r.date_arrivee) * p.prix_nuit AS cout_sejour
FROM reservation_hotel r
JOIN visiteur v ON v.id_visiteur = r.id_visiteur
JOIN hotel h ON h.id_hotel = r.id_hotel
JOIN type_chambre tc ON tc.id_type_chambre = r.id_type_chambre
JOIN propose p ON p.id_hotel = r.id_hotel AND p.id_type_chambre = r.id_type_chambre
ORDER BY cout_sejour DESC;
 
 -- Q16 : visiteurs qui n'ont mangé dans aucun restaurant
SELECT nom_visiteur, prenom_visiteur
FROM visiteur
WHERE id_visiteur NOT IN (SELECT id_visiteur FROM addition);
 
-- Q17 : attractions qui n'ont eu aucun passage
SELECT a.nom_attraction, a.statut
FROM attraction a
WHERE NOT EXISTS (SELECT * FROM passage p WHERE p.id_attraction = a.id_attraction);
 
-- Q18 : zones qui ont au moins une attraction en maintenance
SELECT z.nom_zone
FROM zone z
WHERE EXISTS (SELECT * FROM attraction a
              WHERE a.id_zone = z.id_zone AND a.statut = 'maintenance');
 
-- Q19 : attraction qui a la plus grande capacité
SELECT nom_attraction, capacite
FROM attraction
WHERE capacite >= ALL (SELECT capacite FROM attraction);
 
-- Q20 : attractions situées dans une zone qui propose un spectacle de plus de 30 minutes
SELECT nom_attraction, id_zone
FROM attraction
WHERE id_zone = ANY (SELECT id_zone FROM spectacle WHERE duree_spectacle > 30)
ORDER BY id_zone;
 
-- Q21 : restaurants dont le chiffre d'affaires dépasse la moyenne des restaurants
SELECT nom_restaurant, type_cuisine
FROM restaurant
WHERE id_restaurant IN (SELECT id_restaurant
                        FROM addition
                        GROUP BY id_restaurant
                        HAVING SUM(montant_addition) > (SELECT SUM(montant_addition) / COUNT(DISTINCT id_restaurant)
                                                        FROM addition));
                                                        
-- Q22 : attractions ouvertes ayant eu un temps d'attente de plus de 60 minutes cet été
SELECT DISTINCT a.nom_attraction
FROM attraction a
JOIN passage p ON p.id_attraction = a.id_attraction
WHERE a.statut = 'ouverte'
  AND p.temps_attente > 60
  AND p.date_heure BETWEEN '2026-06-01' AND '2026-08-31';


