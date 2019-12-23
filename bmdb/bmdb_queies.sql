select * from movie;
select * from actor;
select * from credit;
select count(*) from actor where birthdate < '1968-01-03';
select firstName, lastName from actor where birthdate < '1968-01-03';

select * from actor a
join credit c on c.actorID = a.id 
where c.movieID = '1';

select firstName, lastName from actor where id in 
(select actorID from credit where movieId = '1');

select firstName, lastName from actor where id in 
(select actorID from credit where movieId = '2');

select firstName, lastName from actor where id in 
(select actorID from credit where movieId = '3');

select m.title, a.firstName, a.lastName
from movie m, actor a, credit c
where c.movieID = m.id and c.actorID = a.id;

select * from movie where title = "Top Gun";

select m.title "Title", m.year "Year", m.rating "Rating", 
concat(a.firstName, " ", a.lastName) "Actor", c.role "Role"
from credit c join movie m on c.movieID = m.id
join actor a on c.actorID = a.id  
order by 4;

insert into movie values 
	(4,'Jerry McGuire','R',1996,'Cameron Crowe'), 
	(5,'Remember the Titans','PG',2000,'Boaz Yakin'), 
	(6,'Back to the Future','PG',1985,'Robert Zemekis'), 
	(7,'Raiders of the Lost Ark','PG',1981,'Steven Spielberg'),
	(8,'Men in Black','PG-13',1997,'Barry Sonnenfeld'), 
	(9,'Goonies','PG',1985,'Richard Donner'),
	(10,'Indiana Jones and the Temple of Doom','PG',1984,'Steven Spielberg'); 
    
insert into actor values 
	(8,'Renee','Zellweger','Female','1969-04-25'),
    (9,'Cuba','Gooding Jr','Male','1968-01-02'),
    (10,'Denzel','Washingtonr','Male','1954-12-28'),
    (11,'Michael J.','Fox','Male','1961-06-09'),
    (12,'Harrison','Ford','Male','1942-07-13'),
    (13,'Will','Smith', 'Male','1968-09-25'),
    (14,'Tommy Lee','Jones','Male','1946-09-15'),
    (15,'Sean','Astin','Male','1971-02-25'),
    (16,'Corey','Feldman','Male','1971-07-16'),
    (17,'Kate','Capshaw','Female','1953-11-03');
    
insert into credit values 
	(0, 4, 6, 'Jerry'),
    (0, 4, 8, 'Dorothy'),
    (0, 4, 9, 'Rod'),
    (0, 5, 10, 'Coach Herman'),
    (0, 6, 11, 'Marty'),
    (0, 7, 12, 'Indiana Jones'),
    (0, 8, 13, 'Jay'),
    (0, 8, 14, 'Kay'),
    (0, 9, 15, 'Mikey'),
    (0, 9, 16, 'Mouth'),
    (0, 10, 12, 'Indiana Jones'),
    (0, 10, 17, 'Willie');
    
update credit set role = 'Mouth' where movieID = 9 and actorid = 16;

select count(*) from credit where actorID in 
(select ID from actor where firstName = 'Tom'
and lastName = 'Cruise');

select title, year, rating from movie
where rating = 'PG'; 

select rating, count(*) from movie
group by 1 order by 1;   

insert into movie values 
	(0,'Guardians of the Galaxy','PG-13',2014,'James Gunn'); 
insert into movie values 
	(0,'Spider-Man: Far from Home','PG-13',2019,'Jon Watts'); 
    
insert into actor values 
	(0,'Tom','Holland','Male','1996-06-01'),
    (0,'Liam','Hemsworth','Male','1990-01-13');
    
select m.title, a.firstName, a.lastName 
	from movie m
	left join credit c on c.movieID = m.id
    left join actor a on c.actorID = a.id
    order by 1,2;
    
select m.title, a.firstName, a.lastName 
	from movie m
	right join credit c on c.movieID = m.id
   right join actor a on c.actorID = a.id
    order by 1,2;
    
select a.firstName, a.lastName, m.title, c.role
	from actor a
	left join credit c on c.actorID = a.id
    left join movie m on c.movieID = m.id
    order by 2,1,3;
    
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

use bmdb;
select * from actor where birthdate < '1980-01-01' and firstName like 'T%';



    
  