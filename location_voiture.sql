drop database location_voitures;
CREATE DATABASE location_voitures;
USE location_voitures;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(20),
    adresse VARCHAR(255)
);
CREATE TABLE voitures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marque VARCHAR(100),
    modele VARCHAR(100),
    annee INT,
    prix_jour DECIMAL(10, 2),
    statut ENUM('Disponible', 'Louée', 'Entretien') DEFAULT 'Disponible'
);
CREATE TABLE contrats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_voiture INT,
    date_debut DATE,
    date_fin DATE,
    total DECIMAL(10, 2),
    statut ENUM('En cours', 'Terminé', 'Annulé') DEFAULT 'En cours',
    FOREIGN KEY (id_client) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (id_voiture) REFERENCES voitures(id) ON DELETE CASCADE
);

INSERT INTO clients (nom, prenom, email, telephone, adresse) VALUES
('hamri', 'Sanaa', 'H.Sanaa@gmail.com', '0612345678', '10 rue de Qods'),
('benjaloun', 'Zakaria', 'Ziko.Ben@gmail.com', '0612345679', '15 avenue des hassan 2'),
('farihi', 'mariam', 'Farihi.M@gmail.com', '0612345680', '20 boulevard molay abdellah'),
('Ettalhi', 'Adam', 'A.Ettalhi@gmail.com', '0612345681', '25 rue saida'),
('Ettalhi', 'Sara', 'S.ettalhi@gmail.com', '0612345682', '38 rue kech'),
('Harakat', 'Raghad', 'R.Harakat@gmail.com', '0612345683', '35 rue massira'),
('harakat', 'Houssam', 'H.Harakat@gmail.com', '0612345684', '40 rue Safi 1');

INSERT INTO voitures (marque, modele, annee, prix_jour, statut) VALUES
('Peugeot', '208', 2020, 300.00, 'Disponible'),
('Renault', 'Clio', 2021, 250.00, 'Louée'),
('Citroën', 'C3', 2019, 300.00, 'Disponible'),
('Volkswagen', 'Golf', 2022, 350.00, 'Entretien'),
('Toyota', 'Yaris', 2020, 250.00, 'Disponible'),
('Ford', 'Focus', 2018, 250.00, 'Disponible'),
('BMW', 'Serie 1', 2021, 400.00, 'Louée');

INSERT INTO contrats (id_client, id_voiture, date_debut, date_fin, total, statut) VALUES
(1, 1, '2024-12-01', '2024-12-07', 350.00, 'En cours'),
(2, 2, '2024-11-20', '2024-11-25', 225.00, 'Terminé'),
(3, 3, '2024-12-05', '2024-12-10', 200.00, 'En cours'),
(4, 4, '2024-11-15', '2024-11-20', 300.00, 'Annulé'),
(5, 5, '2024-12-01', '2024-12-03', 110.00, 'En cours'),
(6, 6, '2024-11-10', '2024-11-15', 240.00, 'Terminé'),
(7, 7, '2024-12-08', '2024-12-15', 525.00, 'En cours');

select * from voitures;
select * from contrats;
select * from clients;


DELETE FROM clients WHERE nom = 'hamri'
DELETE FROM contrats WHERE statut = 'Annulé'
DELETE FROM voitures WHERE prix_jour = 250;

UPDATE clients
SET email = 'Farihi.M@gmail.com', 
    telephone = '0623571987'
WHERE nom = 'farihi' AND prenom = 'mariam';

UPDATE clients
SET adresse = 'BenJALOUN.ZAKARIA@gmail.com', 
    telephone = '0623435678'
WHERE nom = 'benjaloun' AND prenom = 'Zakaria';

UPDATE contrats
SET date_debut = '2024-12-22', 
    date_fin = '2025-01-22'
WHERE statut = 'En cours' and id_client=3;

SELECT contrats.id, 
       clients.nom, clients.prenom, 
       voitures.marque, 
       contrats.date_debut, contrats.date_fin, 
       contrats.total, contrats.statut
FROM contrats
JOIN clients ON contrats.id_client = clients.id
JOIN voitures ON contrats.id_voiture = voitures.id;

SELECT COUNT(*) FROM voitures;
SELECT COUNT(*) FROM voitures WHERE statut = 'Louée';

