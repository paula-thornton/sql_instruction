insert into request (
		userId, description, justification, dateNeeded,
		deliveryMode, status, total, submittedDate)
        values (1, "office supplies", "new hire", "2019-11-14",
        "UPC", "New", 1.0, "2019-11-07");
        
insert into lineitem values (1, 1, 1, 1);

select * from lineitem where requestID = 1;

        