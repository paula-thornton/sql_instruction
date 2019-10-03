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
join actor a on c.actorID = a.id order by m.title;