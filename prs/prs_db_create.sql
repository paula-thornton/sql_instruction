drop database if exists prs;
create database prs;
use prs;

-- DDL - Create Tables
DROP TABLE IF EXISTS user;
CREATE TABLE user (
	ID				INT	PRIMARY KEY AUTO_INCREMENT,
	UserName		VARCHAR(20)	 		NOT NULL,
	Password		VARCHAR(10)			NOT NULL,
	FirstName		VARCHAR(20)			NOT NULL,
	LastName		VARCHAR(20)			NOT NULL,
	PhoneNumber		VARCHAR(12)			NOT NULL,
	Email			VARCHAR(75)			NOT NULL,
	IsReviewer		TinyInt(1)			DEFAULT 1 NOT NULL,
	IsAdmin			TinyInt(1)			DEFAULT 1 NOT NULL,
    CONSTRAINT uname UNIQUE (Username)
);

DROP TABLE IF EXISTS vendor;
CREATE TABLE vendor (
	ID				INT PRIMARY KEY AUTO_INCREMENT,
	Code			VARCHAR(10)			NOT NULL,
	Name			VARCHAR(255)		NOT NULL,
	Address			VARCHAR(255)		NOT NULL,
	City			VARCHAR(255)		NOT NULL,
	State			VARCHAR(2)			NOT NULL,
	Zip				VARCHAR(5)			NOT NULL,
	PhoneNumber		VARCHAR(12)			NOT NULL,
	Email			VARCHAR(100)		NOT NULL,
    CONSTRAINT vcode UNIQUE (Code) 
);

DROP TABLE IF EXISTS request;
CREATE TABLE request (
	ID					INT	PRIMARY KEY AUTO_INCREMENT,
	UserID				INT				NOT NULL,
	Description			VARCHAR(100)	NOT NULL,
	Justification		VARCHAR(255)	NOT NULL,
	DateNeeded			DATE			NOT NULL,
	DeliveryMode		VARCHAR(25)		NOT NULL,
	Status				VARCHAR(20)		DEFAULT "NEW" NOT NULL,
	Total				DECIMAL(10,2)	NOT NULL,
	SubmittedDate		DATETIME		NOT NULL,
	ReasonForRejection	VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES user(ID)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product (
	ID					INT PRIMARY KEY AUTO_INCREMENT,
	VendorID			INT				NOT NULL,
	PartNumber			VARCHAR(50)		NOT NULL,
	Name				VARCHAR(150)	NOT NULL,
	Price				DECIMAL(10,2)	NOT NULL,
	Unit				VARCHAR(255),
	PhotoPath			VARCHAR(255),
    CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber),
	FOREIGN KEY (VendorID) REFERENCES vendor(ID)
);

CREATE TABLE lineitem (
	ID					INT				PRIMARY KEY AUTO_INCREMENT,
	RequestID			INT				NOT NULL,
    ProductID			INT				NOT NULL,
	Quantity			INT				NOT NULL,
    stuffystuffystuffyCONSTRAINT req_pdt UNIQUE (RequestID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES product(ID),
    FOREIGN KEY (RequestID) REFERENCES request(ID)
);

DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;

insert into user values 
	(1, 'ab123', 'secret', 'Adam', 'Barrett','513-123-4567','AdamBarrett@gmail.com',0,0);
insert into user values 
	(2, 'cd456', 'shhhhh', 'Chris', 'Dennis','513-890-1234','ChrisDennis@gmail.com',1,1);  

insert into vendor values 
	(1, 'AABBCC123','Scotts Office Supplies', '123 Main St',
     'Franklin','OH','45036','937-746-1111','ScottSupplies@yahoo.com');

 insert into vendor values 
	(2, 'WXYZ321','Bob\'s Office Furntiure', '4567 Broadway St',
     'Miamisburg','OH','45222','937-789-2222','BobsFurniture@yahoo.com');
     
insert into product values
	(1, 1, 'LglPad123', 'Legal Pad', 1.99, NULL, NULL);
insert into product values
	(2, 2, 'OfcChr123', 'Black Chair', 199.99, '1 each', NULL);
    


    