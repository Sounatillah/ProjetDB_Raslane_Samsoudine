Projet MERISE  Gestion d’un parc d’attractions

Dans le cadre du projet, nous avons choisi le domaine des loisirs et du divertissement, plus précisément l’exploitation d’un parc d’attractions. Notre objectif est d’analyser les besoins d’une entreprise fictive afin de préparer la conception de son système d’information selon la méthode MERISE.

Nous avons d’abord rédigé un prompt définissant le rôle de l’intelligence artificielle, le contexte de l’entreprise, des références à trois parcs existants (Disneyland Paris, Parc Astérix et Europa-Park) ainsi que les résultats attendus : une liste de règles de gestion et un dictionnaire de 25 à 35 données. Nous avons ensuite soumis ce prompt à l’IA, puis examiné les règles et le dictionnaire produits pour vérifier leur cohérence avec notre demande. Le résultat initial comportait 25 règles de gestion et 34 données.

Lors de la préparation du MCD, nous avons ajouté une règle de gestion relative à la supervision des employés afin de représenter une relation hiérarchique entre employés
Après l'ajout de la règle de supervision, la liste ci-dessous contient 26 règles. Le dictionnaire de données initial reste inchangé (34 données) : cette nouvelle règle porte sur les liens entre employés et ne nécessite pas de nouvel attribut métier.

1. Prompt utilisé
Le texte ci-dessous reprend le prompt soumis à l’IA :

Tu travailles dans le domaine du loisir et du divertissement. Ton entreprise a comme activité de l’exploitation d’un parc d’attraction. C’est une entreprise comme Disneyland, Astérix, Europa Park. Les données sont collectées sur les visiteurs, les attractions, les employés, les billets, les spectacles, les restaurants, hôtels et les différentes zones du parc. Inspire-toi du site web suivant : https://www.disneylandparis.com/fr-fr,https://www.parcasterix.fr/, https://www.europapark.de/fr .
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
D’abord, établis les règles de gestions des données de ton entreprise sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données.

2. Règles de gestion

   Les règles suivantes proviennent du document obtenu auprès de l’IA.
- 1. Visiteurs — Le parc accueille des visiteurs. Pour chacun, nous connaissons son nom, son prénom, sa date de naissance et son adresse e-mail.
- 2. Visiteurs — Un visiteur peut acheter plusieurs billets, par exemple pour toute sa famille ou pour des séjours différents. Un même visiteur peut donc revenir plusieurs fois au parc.
- 3. Billets — Chaque billet porte un numéro unique et est acheté par un seul visiteur. Il est utilisé par une seule personne.
- 4. Billets — Il existe plusieurs types de billets : 1 jour, 2 jours, annuel, etc.
- 5. Billets — Le prix dépend du type de billet et de la catégorie tarifaire de la personne : enfant, adulte ou senior.
- 6. Billets — Un billet est valable à partir d'une date de validité précise. Pour un billet de plusieurs jours, c'est la date du premier jour.
- 7. Zones du parc — Le parc est découpé en zones thématiques, par exemple un royaume médiéval, une zone aquatique ou une zone dédiée aux enfants.
- 8. Zones du parc — Chaque zone a un nom unique et un thème.
- 9. Zones du parc — Une zone regroupe plusieurs attractions, plusieurs restaurants et plusieurs salles de spectacle.
- 10. Zones du parc — Une attraction, un restaurant ou un spectacle se trouve dans une seule zone.
- 11. Attractions — Chaque attraction a un nom, une taille minimale requise (en cm), une capacité (nombre de personnes par tour) et un statut : ouverte, fermée ou en maintenance.
- 12. Attractions — Lorsqu'un visiteur entre dans une attraction, son billet est scanné. Nous enregistrons alors la date et l'heure de passage ainsi que le temps d'attente en minutes.
- 13. Attractions — Un visiteur peut faire plusieurs fois la même attraction dans la journée, et plusieurs attractions différentes.
- 14. Attractions — Un billet doit être valable le jour du passage pour accéder à une attraction.
- 15. Spectacles — Chaque spectacle a un titre et une durée en minutes.
- 16. Spectacles — Un même spectacle peut être joué plusieurs fois par jour, à des dates et heures différentes.
- 17. Spectacles — Chaque représentation dispose d'un nombre de places limité.
- 18. Restaurants — Chaque restaurant a un nom et un type de cuisine : rapide, buffet, gastronomique, etc.
- 19. Restaurants — Quand un visiteur règle un repas, nous enregistrons le montant de l'addition. Un visiteur peut manger dans plusieurs restaurants pendant son séjour.
- 20. Hôtels — Le parc possède plusieurs hôtels. Chacun a un nom et un nombre d'étoiles.
- 21. Hôtels — Un hôtel propose plusieurs types de chambres : standard, familiale, suite, etc.
- 22. Hôtels — Le prix par nuit dépend du type de chambre et de l'hôtel.
- 23. Hôtels — Un visiteur réserve un ou plusieurs types de chambres dans un hôtel, avec une date d'arrivée et une date de départ. Il peut faire plusieurs séjours à des périodes différentes.
- 24. Employés — Chaque employé a un nom, un prénom, une fonction (opérateur d'attraction, cuisinier, artiste, agent d'accueil, etc.) et une date d'embauche.
- 25. Employés — Un employé est affecté à une seule zone du parc à la fois. Une zone affecte plusieurs employés.
- 26. Employés — Un employé peut superviser plusieurs autres employés, mais chaque employé ne peut avoir qu’un seul superviseur au maximum.
 
 3. Dictionnaire de données
    
    ## Dictionnaire de données

| N° | Attribut| Type |
|---|---|---|
| 1 | Nom du visiteur | VARCHAR() |
| 2 | Prénom du visiteur | VARCHAR() |
| 3 | Date de naissance du visiteur | DATE |
| 4 | Adresse e-mail du visiteur | VARCHAR() |
| 5 | Numéro du billet | INT |
| 6 | Type de billet (1 jour, 2 jours, annuel…) | VARCHAR() |
| 7 | Catégorie tarifaire (enfant, adulte, senior) | VARCHAR() |
| 8 | Date de validité du billet | DATE |
| 9 | Prix du billet en euros | DECIMAL() |
| 10 | Nom de la zone | VARCHAR() |
| 11 | Thème de la zone | VARCHAR() |
| 12 | Nom de l'attraction | VARCHAR() |
| 13 | Taille minimale requise (en cm) | INT |
| 14 | Capacité de l'attraction (personnes par tour) | INT |
| 15 | Statut de l'attraction (ouverte, fermée, maintenance) | VARCHAR() |
| 16 | Date et heure de passage dans l'attraction | DATETIME |
| 17 | Temps d'attente avant l'attraction (en minutes) | INT |
| 18 | Titre du spectacle | VARCHAR() |
| 19 | Durée du spectacle (en minutes) | INT |
| 20 | Date et heure de la représentation | DATETIME |
| 21 | Nombre de places de la représentation | INT |
| 22 | Nom du restaurant | VARCHAR() |
| 23 | Type de cuisine du restaurant | VARCHAR() |
| 24 | Montant de l'addition en euros | DECIMAL() |
| 25 | Nom de l'hôtel | VARCHAR() |
| 26 | Nombre d'étoiles de l'hôtel | INT |
| 27 | Type de chambre (standard, familiale, suite…) | VARCHAR() |
| 28 | Prix de la chambre par nuit en euros | DECIMAL() |
| 29 | Date d'arrivée à l'hôtel | DATE |
| 30 | Date de départ de l'hôtel | DATE |
| 31 | Nom de l'employé | VARCHAR() |
| 32 | Prénom de l'employé | VARCHAR() |
| 33 | Fonction de l'employé | VARCHAR() |
| 34 | Date d'embauche de l'employé | DATE |


## 4. Modèle Conceptuel de Données (MCD)

Voici notre MCD pour la gestion d'un parc d'attractions.

![MCD du parc d'attractions](MCD_Parc_Attractions.png)

 ## 5. Modèle logique de données (MLD)

```text
visiteur = (id_visiteur INT, nom_visiteur VARCHAR(50), prénom_visiteur VARCHAR(50), date_naissance DATE, email VARCHAR(50));
zone = (id_zone INT, nom_zone VARCHAR(50), theme_zone VARCHAR(50));
attraction = (id_attraction INT, nom_attraction VARCHAR(50), taille_minimale INT, capacité INT, statut VARCHAR(50), #id_zone);
spectacle = (id_spectacle INT, titre_spectacle VARCHAR(100), duree_spectacle INT, #id_zone);
représentation = (#id_spectacle, num_representation INT, date_heure_representation DATETIME, nombre_places INT);
restaurant = (id_restaurant INT, nom_restaurant VARCHAR(30), type_cuisine VARCHAR(30), #id_zone);
Addition = (id_addition INT, montant_addition DECIMAL(8,2), #id_restaurant, #id_visiteur);
Hotel = (id_hotel INT, nom_hotel VARCHAR(50), nombres_etoiles INT);
Type_Chambre = (id_type_chambre INT, type_chambre VARCHAR(50));
employe = (Id_employe INT, nom_employe VARCHAR(50), prenom_employe VARCHAR(50), fonction VARCHAR(50), date_embauche DATE, #Id_superieur, #id_zone);
tarif = (id_tarif INT, type_billet VARCHAR(50), catégorie_tarifaire VARCHAR(50), prix_billet DECIMAL(7,2));
reservation_hotel = (id_reservation INT, date_arrive DATE, date_départ DATE, #id_type_chambre, #id_hotel, #id_visiteur);
billet = (num_billet INT, date_validité DATE, #id_tarif, #id_visiteur);
passage = (id_passage INT, temps_attente INT, date_heure DATETIME, #id_attraction, #num_billet);
propose = (#id_type_chambre, #id_hotel, prix_nuit DECIMAL(7,2));
```
## 6. Fichiers SQL

1. [Création des tables](1_creation.sql)
2. [Ajout des contraintes](2_contraintes.sql)
3. [Insertion des données](3_insertion.sql)

 ## Prompt utilisé pour l’insertion

 Tu travailles dans le domaine du loisir et du divertissement. Ton entreprise a comme activité l'exploitation d'un parc d'attractions. C'est une entreprise comme Disneyland, Astérix, Europa Park. Les données sont collectées sur les visiteurs, les attractions, les employés, les billets, les spectacles, les restaurants, les hôtels et les différentes zones du parc. Inspire-toi des sites web suivants : https://www.disneylandparis.com/fr-fr, https://www.parcasterix.fr/, https://www.europapark.de/fr.

  La base de données a été créée sous MySQL avec les deux scripts ci-joint : 1_creation.sql pour les tables et 2_contraintes.sql pour les contraintes.
Génère un script SQL d'insertion pour remplir cette base avec des données réalistes. Les tables doivent être remplies dans l'ordre des clés étrangères, avec des identifiants explicites, et toutes les contraintes doivent être respectées. Les données doivent être cohérentes entre elles (par exemple, un passage a lieu pendant la validité du billet). Mets assez de données pour pouvoir faire des requêtes : une quarantaine de visiteurs, environ 25 attractions, 75 billets et 200 passages, et les autres tables en proportion.

## 7. Scénario d'utilisation

La base est utilisée par la directrice du parc, Catherine Lemoine. À la fin de la saison 2026, elle fait le bilan de l'année pour préparer la saison 2027 : quelles attractions remettre en service ou agrandir, quels restaurants et hôtels marchent le mieux, et comment le personnel est réparti.
Elle se pose les questions suivantes (les numéros sont ceux des requêtes de `4_interrogation.sql`) :

- **Q1** : Quelles attractions sont fermées ou en maintenance ?
- **Q2** : Quels types de cuisine sont proposés dans les restaurants du parc ?
- **Q3** : Quelles attractions sont accessibles aux enfants (taille minimale de 100 cm au plus) ?
- **Q4** : Quels visiteurs ont une adresse gmail, pour leur envoyer un questionnaire de satisfaction ?
- **Q5** : Quels passages de l'été ont eu plus d'une heure d'attente ?
- **Q6** : Combien y a-t-il d'employés par fonction ?
- **Q7** : Combien de billets ont été vendus et quelle recette par type de billet ?
- **Q8** : Quelles attractions sont les plus fréquentées (plus de 12 passages) ?
- **Q9** : Quels restaurants ont fait plus de 300 € de chiffre d'affaires ?
- **Q10** : Quel est le prix minimum, maximum et moyen d'une nuit dans chaque hôtel ?
- **Q11** : Dans quelle zone se trouve chaque attraction ?
- **Q12** : Combien de passages y a-t-il eu dans chaque zone ?
- **Q13** : Combien de réservations a chaque hôtel, y compris les hôtels sans réservation ?
- **Q14** : Qui est le supérieur de chaque employé ?
- **Q15** : Combien a coûté chaque séjour à l'hôtel ?
- **Q16** : Quels visiteurs n'ont mangé dans aucun restaurant ?
- **Q17** : Quelles attractions n'ont eu aucun passage ?
- **Q18** : Quelles zones ont au moins une attraction en maintenance ?
- **Q19** : Quelle attraction a la plus grande capacité ?
- **Q20** : Quelles attractions se trouvent dans une zone qui propose un spectacle de plus de 30 minutes ?
- **Q21** : Quels restaurants ont un chiffre d'affaires supérieur à la moyenne ?
- **Q22** : Quelles attractions encore ouvertes ont eu plus de 60 minutes d'attente cet été ? Elles sont candidates à un agrandissement ; celles passées en maintenance depuis sont écartées.

4. [Requêtes d’interrogation](4_interrogation.sql)

## 8. Étude des plans d'exécution

### Requête étudiée

Q22 : noms des attractions ouvertes qui ont eu plus de 60 minutes d'attente cet été.

```sql
SELECT DISTINCT a.nom_attraction
FROM attraction a
JOIN passage p ON p.id_attraction = a.id_attraction
WHERE a.statut = 'ouverte'
  AND p.temps_attente > 60
  AND p.date_heure BETWEEN '2026-06-01' AND '2026-08-31';
```

En algèbre relationnelle :

π nom_attraction ( σ statut = 'ouverte' ∧ temps_attente > 60 ∧ date_heure entre 2026-06-01 et 2026-08-31 ( attraction ⋈ passage ) )

Elle utilise trois opérateurs : la sélection σ, la jointure ⋈ et la projection π.

Nombre de lignes dans les tables : attraction = 25, passage = 228.

Pour compter les instructions, on applique la méthode du TD3 (exercice 6) :
- une jointure entre A de taille n1 et B de taille n2 nécessite n1 × n2 instructions ;
- une projection ou une sélection parcourt toute la table de taille n, soit n instructions.

### Plan 1 : jointure d'abord

```mermaid
flowchart TD
    P["π nom_attraction<br/>6 lignes"] --> S["σ statut = 'ouverte' ∧ temps_attente > 60 ∧ date d'été<br/>22 lignes"]
    S --> J["⋈ attraction.id_attraction = passage.id_attraction<br/>228 lignes"]
    J --> A["attraction<br/>25 lignes"]
    J --> PA["passage<br/>228 lignes"]
```

| Étape | Opération | Lignes en entrée | Instructions | Lignes en sortie |
|---|---|---|---|---|
| 1 | attraction ⋈ passage | 25 et 228 | 25 × 228 = 5 700 | 228 |
| 2 | σ statut, temps_attente et date | 228 | 228 | 22 |
| 3 | π nom_attraction | 22 | 22 | 6 |
| | **Total** | | **5 950** | |

### Plan 2 : sélections d'abord

```mermaid
flowchart TD
    P["π nom_attraction<br/>6 lignes"] --> J["⋈ attraction.id_attraction = passage.id_attraction<br/>22 lignes"]
    J --> S1["σ statut = 'ouverte'<br/>20 lignes"]
    J --> S2["σ temps_attente > 60 ∧ date d'été<br/>23 lignes"]
    S1 --> A["attraction<br/>25 lignes"]
    S2 --> PA["passage<br/>228 lignes"]
```

| Étape | Opération | Lignes en entrée | Instructions | Lignes en sortie |
|---|---|---|---|---|
| 1 | σ statut = 'ouverte' sur attraction | 25 | 25 | 20 |
| 2 | σ temps_attente > 60 et date d'été sur passage | 228 | 228 | 23 |
| 3 | jointure des deux résultats | 20 et 23 | 20 × 23 = 460 | 22 |
| 4 | π nom_attraction | 22 | 22 | 6 |
| | **Total** | | **735** | |

### Conclusion

Le plan 2 demande environ 8 fois moins d'instructions que le plan 1 (735 contre 5 950). La jointure est l'opération la plus coûteuse, car elle compare chaque ligne d'une table avec chaque ligne de l'autre. En faisant les sélections avant la jointure, on réduit attraction à 20 lignes et passage à 23 lignes, et la jointure ne fait plus que 460 comparaisons au lieu de 5 700. Le plan 2 est donc le plan optimisé : il faut appliquer les sélections le plus tôt possible, avant les jointures.



   

