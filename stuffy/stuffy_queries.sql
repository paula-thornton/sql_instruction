use stuffy_db;
insert into stuffy values 
	(0, 'dummy', 'black', 'XL', 10);
select * from stuffy;
update stuffy set type = 'dummy2' where type = 'dummy';
update stuffy set size = 'XS' where type = 'dummy';
delete from stuffy where id = 11;
