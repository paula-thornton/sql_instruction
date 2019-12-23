drop database if exists cao_db;
create database cao_db;
use cao_db;

-- DDL - Create Tables
create table item (
	upc				char(13)		primary key,
    description		varchar(25)		not null,
    retailMultiple	integer			not null,
    retail			decimal(8,2)	not null,
    boh				int				not null,
    min				int				not null,
    alloc			int				not null,
    pack			int				not null,
    status			char(1)			not null
);

create table orderHeader (
	orderNumber		int				primary key auto_increment,
    dueDate			date			not null,
	deliveryDate	date			not null,
    orderStatus		int				not null  # (0=empty, 1=open, 2=closed, 3=released, 4=received)
);

create table OrderDetail (
	orderNumber		int				not null,
    upc				char(13)		not null,
    suggestQty		int				not null,
    actualQty		int				not null,
    receivedQty		int				not null,
    adjustmentRsn	varchar(50)
);

create table salesHistory(
	salesDate		date			not null,
	upc			    char(13)		not null,
    retailMultiple	integer			not null,
    retail			decimal(8,2)	not null,
    units			integer			not null,
    CONSTRAINT sls_hst UNIQUE (salesDate, upc)
); 

DROP USER IF EXISTS cao_db_user@localhost;
CREATE USER cao_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON cao_db.* TO cao_db_user@localhost;
