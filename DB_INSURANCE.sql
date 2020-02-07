create database db_1BM19CS403;
use db_1BM19CS403;
create table person
(
driver_id varchar(20)primary KEY,
name varchar(20),
address varchar(20)
);

insert into person values('A01','Richard','Srinivas nagar');
insert into person values('A02','Pradeep','Rajaji nagar');
insert into person values('A03','Smith','Ashok nagar');
insert into person values('A04','Venu','N R Colony');
insert into person values('A05','Jhon','Hanumanth nagar');

select *from particepated;

create table car
(
reg_num varchar(20)primary key,
model varchar(20),
year int
);
insert into car values('KA052250','Indica',1990);
insert into car values('KA031181','Lancer',1957);
insert into car values('KA095477','Toyota',1998);
insert into car values('KA053408','Honda',2008);
insert into car values('KA053408','Audi',2005);

create table owns
(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

insert into owns values('A01','KA052250');
insert into owns values('A02','KA053408');
insert into owns values('A03','KA031181');
insert into owns values('A04','KA095477');
insert into owns values('A05','KA041702');

CREATE table accident
(
report_num int primary key,
accident_date date,
location varchar(30)
);

insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','Sounth end Circle');
insert into accident values(13,'2003-01-21','Bull Temple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2005-03-04','kanakpura Road');

create table particepated
(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);

insert into  particepated values('A01','KA052250',11,10000);
insert into  particepated values('A02','KA053408',12,50000);
insert into  particepated values('A03','KA095477',13,25000);
insert into  particepated values('A04','KA031181',14,3000);
insert into  particepated values('A05','KA041702',15,5000);

