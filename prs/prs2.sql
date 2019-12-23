select * from item;
select * from orderdetail;
select * from saleshistory;
select * from orderheader;

select count(*) from item;
select count(*) from orderdetail;
select count(*) from saleshistory;
select count(*) from orderheader;

select * from request ;
select * from product order by vendorId, id;
select * from vendor;

select * from user;
select a.*, b.price from lineitem a, product b
where a.productID = b.id order by 2,3;
update request set status = 'Review' where 1=1;
delete from vendor where id = 6;
insert into vendor values (7, "STPL123", "Staples Franklin", "3601 Towne Blvd", "Franklin", "OH",
"45036", "513-423-4091", "Supplies@Staples.com") ;
insert into vendor values (8, "OFCDPO1", "Office Depot", "3990 Montgomery Rd", "Loveland", "OH",
"45140", "513-360-6358", "Supplies@OfcDepot.com") ;
insert into vendor values (9, "OFCFURCON", "Office Furniture Connection", "433 Wards Corner Rd", "Loveland", "OH",
"45140", "513-984-6620", "BobSmith@OfcFurConn.com") ;
update vendor set code = "JOHN2" where id = 5;
select * from user;
delete from user where id = 6;
select * from product order by vendorid;
insert into user values (12, "mn910", "aaaaaa", "Mike", "Nichols", "513-333-5556", "MickyNicky@gmail.com", 0, 1);
update user set phonenumber = '513-333-5555' where id = 11;

insert into product values (12, 9, "Boat Shape Conference Table", 
"Boat Shape Conference Table with Mahogany Finish", 319.50, "1 each", NULL);