#Create database
create database newDb;

#Point to database
use newDb;

#Create tables
create table employee_info(name varchar(20),id int,location varchar(30),age int);
create table employee_location(name varchar(20),location varchar(30));

#Show table details
describe employee_info;

#Add/alter column
alter table employee_info add gender varchar(11);
alter table employee_info modify gender varchar(20);

#Add data
insert into employee_info values('George',1,'Nenagh',32,'Male');
insert into employee_info values('Sam',2,'London',27,'Female');
insert into employee_info values('Linda',3,'Hamshire',65,'Female');
insert into employee_info values('Brad',4,'Derry',46,'Male');
insert into employee_info values('Brad',5,'New York',29,'Male');
insert into employee_info values('Karen',6,'New York',29,'Female');
insert into employee_info values('Hank',7,'New York',21,'Male');

insert into employee_location values('George','Nenagh');
insert into employee_location values('Brad','New York');
insert into employee_location values('Karen','New York');

#Retrieve data from table
select name, id, location from employee_info;
select * from employee_info;

#Drop column
alter table employee_info drop gender;

#Adding primary key
alter table employee_info ADD PRIMARY KEY(id);

#Modify row elements
update employee_info set gender ='Female' where id='3';

#Drop row
delete from employee_info where id = 4;

#Unique selector
select distinct name from employee_info;

#Getting values from table with search conditions
select name from employee_info where location='New York' and age>23;
select name from employee_info where location='New York' and (age>23 or gender='Female');

#Search range between given values
select name, id from employee_info where age between 45 and 99;
select name, id from employee_info where age not between 25 and 50;

#Regex expression
select * from employee_info where name like '_i%';

#Sort results
select * from employee_info order by name;
select * from employee_info order by age desc;

#Get count of elements in column
select count(distinct location) from employee_info;

#Get max/min number
select max(age) from employee_info;
select min(age) from employee_info;

#Get average
select avg(age) from employee_info;

#Get sum of values
select sum(age) from employee_info;

#Get sum grouped by location
select sum(age), location from employee_info group by location;

#Group by selected locations only
select sum(age), location from employee_info
	group by location
		having location = 'Nenagh' or location = 'New York';

#Using sub-queries
select name, id from employee_info
	where name = (select name from employee_location
					where location = 'Nenagh');

#Use 'in' keyword when multiple rows are returned
select name, age from employee_info
	where name in (select name from employee_location
					where location = 'New York');

#Join tables
select e.name, el.location, e.id
	from employee_info as e join employee_location as el
		on e.name = el.name;
