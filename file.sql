-- Creation de la base de données --

CREATE DATABASE Theater;

USE Theater;

-- Creation des tables -- 

CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATETIME NOT NULL,
    email VARCHAR(255) NOT NULL,
    pseudo VARCHAR(20) NOT NULL,
    password CHAR(60) NOT NULL
    

)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE customers (
    status VARCHAR(10) NOT NULL,
    customers_id INT(11) NOT NULL PRIMARY KEY,
    FOREIGN KEY (customers_id) REFERENCES users(id)
    

)    ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE admins (
    admins_id INT(11) NOT NULL PRIMARY KEY,
    FOREIGN KEY (admins_id) REFERENCES users(id)
    
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE TABLE cinemas (
    cinemas_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    adress VARCHAR(250) NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    city VARCHAR(60) NOT NULL,
    phone int(10) NOT NULL,
    admins_id INT(11),
    FOREIGN KEY (admins_id) REFERENCES admins(admins_id)

)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE moviesroom (
    movies_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number_rooms INT(11),
    place_capacity INT(11),
    cinemas_id INT(11) NOT NULL,
    FOREIGN KEY (cinemas_id) REFERENCES cinemas(cinemas_id)
    

)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE projections (
    projections_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    projection_time DATETIME,
    moviesroom_id INT(11) NOT NULL,
    FOREIGN KEY (moviesroom_id) REFERENCES moviesroom(movies_id)
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE genre (
    genre_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(60) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE movies (
    movies_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    duration TIME NOT NULL,
    release_date DATETIME NOT NULL,
    synopsis TEXT NOT NULL,
    directed_by VARCHAR(20),
    projections_id INT(11) NOT NULL,
    genre_id INT(11) NOT NULL,
    FOREIGN KEY (projections_id) REFERENCES projections(projections_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE booking (
    booking_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie VARCHAR(60) NOT NULL,
    date_reservation DATETIME NOT NULL,
    type_payment VARCHAR(20),
    total_price DECIMAL(4,2) NOT NULL,
    date_payment DATETIME NOT NULL,
    place_quantity INT(11) NOT NULL,
    projections_id INT(11) NOT NULL,
    customers_id INT(11) NOT NULL,
    FOREIGN KEY (projections_id) REFERENCES projections(projections_id),
    FOREIGN KEY (customers_id) REFERENCES customers(customers_id)
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- insertion des données dans le base de données --

insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Sondra', 'Neeves', '1980/12/01', 'sneeves0@storify.fr', 'sneeves0', 'sH80nYGrRrJ');
insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Brittne', 'Bourdel', '1982/11/02', 'bbourdel1@about.fr', 'bbourdel1', 'BQnJbikTgAE');
insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Catina', 'Farrears', '1970/09/05', 'cfarrears2@ucla.fr', 'cfarrears2', 'plBHmQz');
insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Duane', 'Baldazzi', '1985/08/01', 'dbaldazzi3@unesco.fr', 'dbaldazzi3', 'hw74L9Dn2GP');
insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Lissy', 'Cuerda', '1985/07/01', 'lcuerda4@arizona.fr', 'lcuerda4', '7R861WPu');
insert into users (first_name, last_name, date_of_birth, email, pseudo, password) values ('Uri', 'Brigstock', '1985/12/01', 'ubrigstock5@ning.fr', 'ubrigstock5', 'ueXIeslrrIFd');


insert into customers (customers_id,status) values (2 , 'Etudiant');
insert into customers (customers_id,status) values (4 , 'Normal');
insert into customers (customers_id,status) values (6 , 'Enfant');

insert into admins (admins_id) values (3) , (5);


insert into cinemas (name, adress, zipcode, city, phone, admins_id) values ('Feest and Sons', '3rd Floor', '98231', 'Zduńska Wola', '4117381399',3);
insert into cinemas (name, adress, zipcode, city, phone, admins_id) values ('Corwin, Maggio and Blanda', 'Suite 62', '22555', 'Vitomarci', '2654800831',5);
insert into cinemas (name, adress, zipcode, city, phone) values ('Reynolds and Sons', 'Room 1994', "69800", 'Condado', '8189994525');
insert into cinemas (name, adress, zipcode, city, phone) values ('Kreiger-Howe', 'Apt 663', '87457', 'Bhātpāra Abhaynagar', '3716830535');
insert into cinemas (name, adress, zipcode, city, phone) values ('Kessler-Brakus', 'PO Box 88553', '29002', 'Maricá', '8814487488');
insert into cinemas (name, adress, zipcode, city, phone) values ('Nolan and Sons', '12th Floor', '69740', 'Kanália', '4697144079');




insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (1, 300,1);
insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (2, 320,3);
insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (3, 250,4);
insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (4, 400,6);
insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (5, 150,2);
insert into moviesroom (number_rooms, place_capacity, cinemas_id) values (6, 200,5);


insert into projections (projection_time,moviesroom_id) values ('2023/12/01 11:00:00',2);
insert into projections (projection_time,moviesroom_id) values ('2023/12/02 12:00:00',1);
insert into projections (projection_time,moviesroom_id) values ('2023/12/03 13:00:00',4);
insert into projections (projection_time,moviesroom_id) values ('2023/12/04 14:00:00',3);
insert into projections (projection_time,moviesroom_id) values ('2023/12/05 15:00:00',5);
insert into projections (projection_time,moviesroom_id) values ('2023/12/06 16:00:00',6);


insert into genre (libelle) values ('Drama|War');
insert into genre (libelle) values ('Action|Adventure|Thriller');
insert into genre (libelle) values ('Adventure|Drama');
insert into genre (libelle) values ('Crime|Drama|Mystery|Thriller');
insert into genre (libelle) values ('Action|Animation|Children|Comedy|Fantasy');
insert into genre (libelle) values ('Action|Drama|Mystery');



insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Carla''s Song', '3:17', '1980/03/06', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed', 'Danice Hast',1,2);
insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Prince Valiant', '2:09', '1970/04/05', 'aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', 'Averill Jurries',2,3);
insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Fullmetal Alchemist', '1:55', '1950/12/12', 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet', 'Trever Goulbourne',5,6);
insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Boiler Room', '0:46', '1940/02/08', 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris', 'Cacilia Cornthwaite',3,4);
insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Life as a House', '3:43', '1965/04/03', 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', 'Erie Cantillion',4,1);
insert into movies (title, duration, release_date, synopsis, directed_by, projections_id, genre_id) values ('Hot Spot, The', '6:43', '1975/12/01', 'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'Lucien Shinfield',6,5);




insert into booking (movie, date_reservation, type_payment, total_price, date_payment, place_quantity,projections_id,customers_id) values ('Too Late the Hero', '2023/05/11', 'CB', 7.60, '2023/02/03', 150,5,4);
insert into booking (movie, date_reservation, type_payment, total_price, date_payment, place_quantity,projections_id,customers_id) values ('Breath, The (Nefes: Vatan sagolsun)', '2023/06/11', 'CB', 9.20, '2023/02/03', 200,6,6);
insert into booking (movie, date_reservation, type_payment, total_price, date_payment, place_quantity,projections_id,customers_id) values ('300', '2023/07/11', 'CB', 5.90, '2023/02/03', 260,2,4);


-- montrer les différents tarifs disponibles :

SELECT `customers`.`status`, `booking`.`total_price`
FROM `customers` 
	LEFT JOIN `booking` ON `booking`.`customers_id` = `customers`.`customers_id`
WHERE `booking`.`total_price`;

-- connaitre les différents administrateurs et les cinémas associés : 

SELECT `admins`.*, `cinemas`.`name`, `users`.`first_name`
FROM `admins` 
	LEFT JOIN `cinemas` ON `cinemas`.`admins_id` = `admins`.`admins_id` 
	LEFT JOIN `users` ON `admins`.`admins_id` = `users`.`id`;

-- connaitre par rapport à une date de projection les places restantes d'une salle :

SELECT `projections`.`projection_time`, `moviesroom`.`place_capacity`
FROM `projections` 
	LEFT JOIN `moviesroom` ON `projections`.`moviesroom_id` = `moviesroom`.`movies_id`
WHERE `projections`.`projection_time` = '2023/12/01 11:00:00';

--affiche les reservations avec le nom des films ainsi que les noms des cinémas associés

SELECT `projections`.*, `booking`.`movie`, `moviesroom`.`cinemas_id`, `cinemas`.`name`
FROM `projections` 
	LEFT JOIN `booking` ON `booking`.`projections_id` = `projections`.`projections_id` 
	LEFT JOIN `moviesroom` ON `projections`.`moviesroom_id` = `moviesroom`.`movies_id` 
	LEFT JOIN `cinemas` ON `moviesroom`.`cinemas_id` = `cinemas`.`cinemas_id`;