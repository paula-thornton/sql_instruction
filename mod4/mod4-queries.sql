select * from customer where state = "OH" order by name;
select * from orders;

-- aliases
select c.customer 'Name', c.creditlimit 'Credit Limit' from customer c;
select customer.* from customer;
select * from orders;

select * from customer where id not in (select customerID from orders);

select a.*, b.* from customer a, orders b
where a.id = b.customerID ;
-- Same as above
select * from customer join orders on orders.customerid = customer.id;

select c.name 'Customer Name', date_format(o.date, "%m/%d/%Y" ) "Order Date", 
concat('$', o.total) "Order Total"
from customer c join orders o on c.id = o.customerid 
order by c.name, o.date;

select c.name 'Customer Name', date_format(o.date, "%m/%d/%Y" ) "Order Date", 
concat('$', o.total) "Order Total"
from customer c join orders o on c.id = o.customerid
where o.total > (select avg(total) from orders) 
order by c.name, o.date;

insert into customer (name, city, state, isCorpAcct, creditLimit) 
values ('Test Cust 2','Monroe','OH','1',1000);

select avg(total) from orders;  -- avg = 548
select sum(total) from orders;

select customerID, sum(total) from orders group by customerID;
select o.customerID "Cust ID", c.name "Customer Name", sum(o.total) "Total" 
from orders o join customer c on o.customerID = c.id 
group by 1 order by 2;
select * from customer;

insert into customer (name, city, state, isCorpAcct, creditLimit) 
values ('Test 3','Monroe', 'OH', 1, 999);
insert into customer values (0, 'Test Corp','Trenton', 'OH', 1, 9999, 0);
select * from customer;
update customer set name = 'Test Inc' where id = 9;

delete from customer where id in (10, 9);
delete from customer where id = 7;

select customerID, sum(total) as OrdTotal
from orders
group by customerID 
having OrdTotal > 1000;