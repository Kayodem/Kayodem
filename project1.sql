show databases;
use student_info;
show tables;
create table student_info (std_id int,
name varchar(30), dept varchar(20), subject varchar(20),
sex char(1), city varchar(10));
describe student_info;
insert into student_info values (1, "john", "account", "financial", "m", "lagos");
insert into student_info values (2, "pius", "scince", "agric", "m", "ibadan"),
(3, "funmi", "science", "biochemistry", "f", "akure"),
(4, "theo", "science", "anatomy", "m", "kano"),
(5, "bunmi", "banking", "cashier", "f", "osun"),
(6, "lanre", "business", "trade", "m", "ogun"),
(7, "dot", "IT", "data analytics", "m", "oyo"),
(8, "dime", "IT", "graphic", "m", "ogun");

select * from student_info;
select name from student_info;
select * from student_info
where std_id <> 3;
select * from student_info
where std_id  between '1' and '5';


select * from student_info
where name = "john";
select * from student_info where sex = "m";
update student_info
set subject = "fancy"
where subject = "trade";
select * from student_info;
insert into student_info values (9, "geoge", "freelancer", "analytics", "m", "oyo"),
(10, "marcus", "bedc", "staff", "m", "port"),
(11, "mikky", "account", "cashier", "f", "lagos"),
(12, "victoria", "nurse", "drug", "f", "abia");
select name from student_info
where name = "pius"or  name = "victoria";
alter table student_info add score float;
select name from student_info
order by name asc;
select * from student_info
limit 5;
insert into student_info (score) values (80);
delete from student_info
where score = 80;
create table teacher_info (teacher_id int auto_increment, name varchar(20),
primary key(teacher_info));
select name from
student_info
where std_id = 2;
select count(name), name
from student_info;
select count(sex),sex
from student_info
group by sex;
update  student_info 
set score = 77
where std_id = 12;
select avg(score) from 
student_info;
select score from 
student_info
group by city
order by std_id asc;
select * from student_info;
select sum(score) sex from 
student_info 
group by sex;

create table teachers (teacher_id int primary key,
name varchar(20), department varchar(20));
describe teachers;
insert into teachers value (1, "olaniyan", "science"),
(2, "mr seun", "art"),
(3, "mrs niran", "commercial"),
(4, "lere", "scince"),
(5, "mr segun", "commercial"),
(6, "ade", "science");
select * from teachers;

select * from student_info
order by score asc;
select name, sex from student_info
order by sex;
select * from student_info
where name = "mikky";
update student_info
set sex = "m"
where name = "mikky";

select sum(score) as total_score
from student_info;
select name from student_info
union
select name from teachers;
select  student_info.name 
from student_info
right join teachers
on student_info.name = teachers.name;
select * from student_info;
select sum(score), score from student_info
where score > 50;
select sum(score), city from student_info
group by city
order by score desc; 
select distinct city from student_info;
select char_length(mikky);
select * from teacher;
select name,  count(*) as city_count
from student_info
having count(*) > 1;
select * from student_info;
select * from student_info
order by std_id desc;
select sum(score) as total_score,sex
from student_info
group by sex;
select * from  student_info
having city > 1;
alter table student_info add test_score varchar(20);
update student_info
set test_score = 40
where std_id = 12;
select test_score from student_info;
select * from student_info;
update student_info
set test_score = 36
where std_id = 3;
select score, test_score, score + test_score
 as total_score from
student_info;
select total_score from student_info;
select * from student_info;
select * from student_info;
select name, dept, sex, score
from student_info where score > (select avg(score) from 
student_info);
select name, dept, score from
student_info where score < (select score from student_info
where score = 70)
delimiter &&
create procedure top_scorer()
begin
select name, dept, score
from student_info where score>56;
end &&
delimiter ;
call top_scorer
delimiter //
create procedure score_sortby(in score float)
begin
select name, dept, score from
student_info order by score desc limit score;
end //
delimiter ;
select name, dept, city,
sum(score) over (partition by dept) as total_score 
from student_info;
select name, dept, sum(score) as total_score
from student_info
group by dept;
select * from student_info;
call top_scorer()
delimiter &&
create procedure total_scorer()
begin
select name, dept,sum(score)
 over (partition by dept) as total_scorer from
 student_info where std_id>2;
 end &&
 delimiter ;
 call total_scorer()
 