use prs;
select * from user;
select * from vendor;
select * from product;
select * from request;
select * from lineitem order by requestID, productID;
select * from product p join vendor v on p.vendorID = v.ID;