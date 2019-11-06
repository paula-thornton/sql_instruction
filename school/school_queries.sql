select * from student;
select * from course;
select * from enrolled;
select * from student where middleInitial is null;
select count(*) from student where state = 'TX';
select state, count(*) from student group by 1 order by 2 desc;
select firstName, lastName, birthday from student order by birthday;
select firstName, lastName, birthday from student order by birthday desc;

select firstname, lastname, birthday from student
where birthday = (select max(birthday) from student);

select firstname, lastname, birthday from student
where birthday = (select max(birthday) from student);

select firstname, lastname, birthday, year(birthday), CURDATE(), year(curdate()),
(year(curdate()) - year(birthday)) "Age"
from student
where birthday = (select max(birthday) from student);

select min(birtday), max(birthday) from student;
select count(*) from course where subject = 'math';
select count(*) from course where subject = 'socialstudies';
select * from course where subject like 'm%';
select firstName, lastName, birthday from student order by birthday desc;

select concat(s.firstName, " ", lastname) "Student Name", c.subject "Subject", 
c.name "Course", c.quarter "Quarter", e.grade "Grade"
from enrolled e join student s on e.studentid = s.id
join course c on e.courseID = c.id order by 1;

select * from student s 
	join enrolled e on e.studentId = s.id
    join course c on e.courseId = c.id;
    
-- pull all students, even if not enrolled in a class
select s.firstName, s.lastName, e.studentID, e.courseID, c.name, e.grade 
	from student s 
	left join enrolled e on e.studentId = s.id
    left join course c on e.courseId = c.id;
    
select s.firstName, s.lastName, e.studentID, e.courseID, e.grade 
	from student s 
	right join enrolled e on e.studentId = s.id;

