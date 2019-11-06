use prs;
select * from user;
select * from vendor;
select * from product;
select * from product p join vendor v on p.vendorID = v.ID;