-- Drop and Create the Database, DDL

drop database if exists food_inv_db;
create database food_inv_db;
use food_inv_db;

-- DDL - Create Tables
create table item (
	id 				int 			primary key auto_increment,
    name			varchar(50)		not null,
    category		varchar(25)		not null,
	expireDate		date			not null,
    onHand			int				not null,
    needed			int,
    CONSTRAINT uitem unique (name, ExpireDate)
	);


insert into item (name, category, expireDate, onHand, needed)
	values ('1% milk', 'dairy', '2020-01-05', 1, 1);
insert into item (name, category, expireDate, onHand, needed)
	values ('eggs', 'dairy', '2020-01-10', 0, 1);
insert into item (name, category, expireDate, onHand, needed)
	values ('orange juice', 'grocery', '2020-01-15', 1, 2);
insert into item (name, category, expireDate, onHand, needed)
	values ('cojack cheese', 'dairy', '2020-01-20', 1, 2);

    
drop user if exists food_user@localhost;
create user food_user@localhost identified by 'sesame';
grant select, insert, delete, update on food_inv_db.* to food_user@localhost;   

select * from item;



