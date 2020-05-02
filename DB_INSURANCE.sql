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

SQL>commit;

Commit complete.
SQL> select * from accident;

  REPORT_NUM   ACCIDENT_DATE     LOCATION
-------------------- ------------ --------------------
 11 		01-JAN-03 		Mysore Road
     12		 02-FEB-04 		Southend Circle
 13		 21-JAN-03 		Bulltemple Road
   14 		17-FEB-08 		Mysore Road
     15		 04-MAR-05 		Kanakpura Road

SQL> insert into owns values ('&driver_id','&reg_num');

Enter value for driver_id: A01
Enter value for reg_num: KA052250
old   1: insert into owns values('&driver_id','&reg_num')
new   1: insert into owns values('A01','KA052250')
1 row created.

SQL>commit;
Commit complete.

SQL> select * from owns;

DRIVER_ID   REG_NUM
---------------- ----------
A01    		 KA052250
A02       	 KA053408
A04       	 KA031181
A03        	KA095477
A05        	KA041702
SQL> insert into participated values ('&driver_id','&reg_num',&report_num, &damage_amount);

Enter value for driver_id: A01
Enter value for reg_num: KA052250
Enter value for report_num: 11 
Enter value for damage_amount: 10000
old   1: insert into participated values ('&driver_id','&reg_num',&report_num,&damage_amount)
new   1: insert into participated values('A01','KA052250',11,10000)

1 row created.

SQL>/
Enter value for driver_id: A02
Enter value for reg_num: KA053408
Enter value for report_num: 12
Enter value for damage_amount: 50000
old   1: insert into participated values ('&driver_id','&reg_num', &report_num,& damage_amount)
new   1: insert into participated values('A02','KA053408',12,50000)

1 row created.

SQL>commit;
Commit complete.
SQL> select * from participated;

DRIVER_ID   REG_NUM        REPORT_NUM  DAMAGE_AMOUNT
------------------------------- ---------- ------------------------------
A01        KA052250           11      		10000
A02        KA053408           12      		50000
A03        KA095477           13      		25000
A04        KA031181           14       		3000
A05        KA041702           15       		5000

QUERY 3:
a) Update the damage amount to 25000 for the car with a specific reg_num (example  'K A053408'  ) for which the accident report number was 12.

SQL> update participated set damage_amount=25000 where reg_num='KA053408' and report_num=12;

1 row updated.

SQL>commit;

Commit complete.

SQL>select * from participated;

DRIVER_ID   REG_NUM  REPORTNUM  DAMAGE_AMOUNT
----------------- ---------- ---------- ----------
A01        KA052250           11      	10000
A02        KA053408           12      	25000
A03        KA095477           13      	25000
A04        KA031181           14       	3000
A05        KA041702           15       	5000

b)  Add a new accident to the database.

SQL>insert into accident values(16,'15-MAR-08','Domlur');
1 row created.

SQL>select * from accident;

  REPORT_NUMACCIDENT_DATE     LOCATION
------------------ ------------  --------------------
     11 		01-JAN-03 		Mysore Road
 12 		02-FEB-04		Southend Circle
 13 		21-JAN-03		Bulltemple Road
  14 		17-FEB-08 		Mysore Road
  15 		04-MAR-05 		Kanakpura Road
  16 		15-MAR-08 		Domlur

6 rows selected.

QUERY 4:  Find the total number of people who owned cars that were involved in accidents in 2008.

SQL>select count(distinct driver_id) CNT from participated a, accident b where a.report_num=b.report_num and b.accident_date like '%08';

       CNT
----------
         1

QUERY 5:  Find the number of accidents in which cars belonging to a specific model (example 'Lancer')  were involved.

SQL> select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';

       CNT
----------
         1

ADDITIONAL QUERIES:
1)	LIST THE ENTIRE PARTICIPATED RELATION IN THE DESCENDING ORDER OF DAMAGE AMOUNT.
SQL> SELECT * FROM PARTICIPATED ORDER BY DAMAGE_AMOUNTT DESC;

2)	FIND THE AVERAGE DAMAGE AMOUNT
SQL> SELECT AVG(DAMAGE_AMOUNTT) FROM PARTICIPATED;

3)	DELETE THE TUPLE WHOSE DAMAGE AMOUNT IS BELOW THE AVERAGE DAMAGE AMOUNT
SQL> DELETE FROM PARTICIPATED WHERE 
DAMAGE_AMOUNTT<(SELECT AVG (DAMAGE_AMOUNT) FROM PARTICIPATED);

4)	LIST THE NAME OF DRIVERS WHOSE DAMAGE IS GREATER THAN THE AVERAGE DAMAGE AMOUNT.
SQL> SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);

5)	FIND MAXIMUM DAMAGE AMOUNT.
SQL>SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;































