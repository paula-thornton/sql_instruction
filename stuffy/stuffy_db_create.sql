drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

-- DDL - Create Tables
create table stuffy (
	id 			int 			primary key auto_increment,
    type		varchar(256)	not null,
    color		varchar(20)		not null,
    size		varchar(2)		not null,
    limbs		int				not null
);

DROP USER IF EXISTS stuffy_db_user@localhost;
CREATE USER stuffy_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON stuffy_db.* TO stuffy_db_user@localhost;

insert into stuffy values 
	(1, 'elephant', 'purple', 'XL', 5),
    (2, 'parrot', 'blue', 'SM', 2),
    (3, 'koala', 'brown', 'MD', 4),
    (4, 'squid', 'yellow', 'LG', 8),
    (5, 'truck', 'orange', 'MD', 4),
    (6, 'martian', 'green', 'LG', 10),
    (7, 'dalmation', 'black,white', 'SM', 4),
    (8, 'tiger', 'orange', 'XL', 4),
    (9, 'dolphin', 'gray', 'MD', 2),
    (10, 'elephant', 'pink', 'XL', 5);
