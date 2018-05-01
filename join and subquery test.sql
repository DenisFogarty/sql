use NewDB;

create table company(Name varchar(20), Branch varchar(20), Employees int);

insert into company values('QAClickAcademy', 'US', 20);
insert into company values('Google', 'US', 500);
insert into company values('Yahoo', 'Canada', 250);
insert into company values('Google', 'India', 400);
insert into company values('QAClickAcademy', 'India', 75);
insert into company values('QAClickAcademy', 'UK', 10);
insert into company values('QAClickAcademy', 'Canada', 30);
insert into company values('Yahoo', 'US', 200);
insert into company values('Yahoo', 'India', 150);
insert into company values('Facebook', 'US', 50);

select * from company;

create table established(Name varchar(20), Year int);

insert into established values('qaclickacademy', 2010);
insert into established values('google', 1998);
insert into established values('yahoo', 1992);
insert into established values('facebook', 1992);

select sum(c.employees), c.name from company as c
	join established as e on e.name = c.name
		where e.year = 1998;

select sum(employees) from company
	where name = (select name from established
					where year = 1998);