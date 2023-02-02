CREATE DATABASE Theater;

USE Theater;

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
    users_id INT(11) NOT NULL PRIMARY KEY,
    FOREIGN KEY (users_id) REFERENCES users(id)

)    ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE admins (
    users_id INT(11) NOT NULL PRIMARY KEY,
    FOREIGN KEY (users_id) REFERENCES users(id)
    
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE TABLE cinemas (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    adress VARCHAR(250) NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    city VARCHAR(60) NOT NULL,
    phone int(10) NOT NULL,
    admins_id INT(11) NOT NULL,
    FOREIGN KEY (admins_id) REFERENCES admins(users_id)

)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE moviesroom (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number_rooms INT(11),
    place_capacity INT(11),
    cinemas_id INT(11) NOT NULL,
    FOREIGN KEY (cinemas_id) REFERENCES cinemas(id)
    

)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE projections (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    projection_time DATETIME,
    moviesroom_id INT(11) NOT NULL,
    FOREIGN KEY (moviesroom_id) REFERENCES moviesroom(id)
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8;