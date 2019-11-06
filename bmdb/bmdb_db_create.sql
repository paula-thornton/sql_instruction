-- 1. create dbmd_db_create.sql
--	base on mod4_database_create
-- 2. create 3 tables only - movie, actor, credit
-- 3. add data to 3 tables (at least 3 movies + actors)
-- 4. practive SQL
-- 	select * from each table
-- 	how many actors olddr than you
-- 	list all actors for a specific movie
-- 	3 table join

drop database if exists bmdb;
create database bmdb;
use bmdb;  -- for rest of statements in this script

create table movie (
	id 			int 			primary key auto_increment,
	title 		varchar(100) 	not null,
    rating		varchar(5)		not null,
    year		integer			not null,
    director	varchar(50)		not null,
    constraint utitle unique (title, year)
);

create table actor (
	id			int				primary key auto_increment,
    firstName	varchar(25)		not null,
    lastName	varchar(25)		not null,
    gender		varchar(6)		not null,
    birthDate	date			not null,
    constraint unq_actor unique (firstName, lastName, birthDate)
);

create table credit (
	id			int				primary key auto_increment,
    movieID		int				not null,
    actorID		int				not null,
    role		varchar(25)		not null,
    FOREIGN KEY (movieID) REFERENCES movie(id),
    FOREIGN KEY (actorID) REFERENCES actor(id),
    constraint act_mov unique (actorID, movieID)
);

insert into movie values (1,'Top Gun','PG',1986,'Tony Scott');
insert into movie values (2,'Forest Gump','PG-13',1994,'Robert Zemeckis');
insert into movie values (3,'Sleepless in Seattle','PG',1993,'Nora Ephron'); 

insert into actor values (1,'Tom','Hanks','Male','1956-07-09');
insert into actor values (2,'Robin','Wright','Female','1966-04-08');
insert into actor values (3,'Gary','Sinise','Female','1955-03-17');
insert into actor values (4,'Meg','Ryan','Female','1961-11-19');
insert into actor values (5,'Bill','Pullman','Male','1953-12-17');
insert into actor values (6,'Tom','Cruise','Male','1962-07-03');
insert into actor values (7,'Kelly','McGillis','Female','1957-07-09');

insert into credit values (0, 1, 6, 'Maverick');
insert into credit values (0, 1, 7, 'Charlie');
insert into credit values (0, 1, 4, 'Carole');
insert into credit values (0, 2, 1, 'Forest');
insert into credit values (0, 2, 2, 'Jenny');
insert into credit values (0, 2, 3, 'Lt. Dan');
insert into credit values (0, 3, 1, 'Sam');
insert into credit values (0, 3, 4, 'Annie');
insert into credit values (0, 3, 5, 'Walter');


