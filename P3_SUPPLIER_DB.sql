create database supplier;
use supplier;

create table supplier
(
sid int primary key,
sname varchar(30),
city varchar(30)
);

insert into supplier values 
(10001,'Acme Widget','Bengalore'),
(10002,'Johns','kolkata'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi');

create table parts 
(
pid int primary key,
pname varchar(30),
color varchar(30)
);

insert into parts values
(20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');
	

create table catalog
(
sid int,
pid int,
cost real,
foreign key(sid) references supplier(sid) on delete cascade,
foreign key(pid) references parts(pid) on delete cascade
);

insert into catalog values
(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);


/*Find the SiD's of supplier who supply some red or green parts*/

select distinct(supplier.sid)
from supplier,parts,catalog 
where  supplier.sid=catalog.sid and parts.pid=catalog.pid and parts.color in('red','green');

/*Find the SiD's of supplier who supply some red parts or whose city is bengalore*/

select distinct(supplier.sid)
from supplier,parts,catalog 
where  supplier.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red' or supplier.city='benglore';

/*Find pairs of SID's such that the supplier with the first SID charges more for some part than the 
supplier with the seconfd side*/

select s1.sid,s2.sid,p1.pid
from supplier s1,supplier s2,parts p1,catalog c1,catalog c2  
where  s1.sid=c1.sid and s2.sid=c2.sid and p1.pid=c1.pid and p1.pid=c2.pid and c1.cost>c2.cost;

SQL> select * from SUPPLIERS;

       SID SNAME                CITY
---------- -------------------- --------------------
     10001 Acme Widget          Bangalore
     10002 Johns                Kolkata
     10003 Vimal                Mumbai
     10004 Reliance             Delhi

SQL> commit;

Commit complete.

SQL> insert into PARTS values(&pid, '&pname','&color');
Enter value for pid: 20001
Enter value for pname: Book
Enter value for color: Red
old   1: insert into PARTS values(&pid, '&pname','&color')
new   1: insert into PARTS values(20001, 'Book','Red')

1 row created.

SQL> /
Enter value for pid: 20002
Enter value for pname: Pen
Enter value for color: Red
old   1: insert into PARTS values(&pid, '&pname','&color')
new   1: insert into PARTS values(20002, 'Pen','Red')

1 row created.

SQL> /
Enter value for pid: 20003
Enter value for pname: Pencil
Enter value for color: Green
old   1: insert into PARTS values(&pid, '&pname','&color')
new   1: insert into PARTS values(20003, 'Pencil','Green')

1 row created.

SQL> /
Enter value for pid: 20004
Enter value for pname: Mobile
Enter value for color: Green
old   1: insert into PARTS values(&pid, '&pname','&color')
new   1: insert into PARTS values(20004, 'Mobile','Green')

1 row created.

SQL> /
Enter value for pid: 20005
Enter value for pname: Charger
Enter value for color: Black
old   1: insert into PARTS values(&pid, '&pname','&color')
new   1: insert into PARTS values(20005, 'Charger','Black')

1 row created.

SQL> select * from PARTS;


       PID PNAME                COLOR
---------- -------------------- ----------
     20001 Book                 Red
     20002 Pen                  Red
     20003 Pencil               Green
     20004 Mobile               Green
     20005 Charger              Black

SQL> commit;

Commit complete.

SQL> insert into CATALOG values(&sid, '&pid','&cost');
Enter value for sid: 10001
Enter value for pid: 20001
Enter value for cost: 10
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10001, '20001','10')

1 row created.

SQL> /
Enter value for sid: 10001
Enter value for pid: 20002
Enter value for cost: 10
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10001, '20002','10')

1 row created.

SQL> /
Enter value for sid: 10001
Enter value for pid: 20003
Enter value for cost: 30
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10001, '20003','30')

1 row created.

SQL> /
Enter value for sid: 10001
Enter value for pid: 20004
Enter value for cost: 10
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10001, '20004','10')

1 row created.

SQL> /
Enter value for sid: 10001
Enter value for pid: 20005
Enter value for cost: 10
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10001, '20005','10')

1 row created.

SQL> /
Enter value for sid: 10002
Enter value for pid: 20001
Enter value for cost: 10
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10002, '20001','10')

1 row created.

SQL> /
Enter value for sid: 10002
Enter value for pid: 20002
Enter value for cost: 20
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10002, '20002','20')

1 row created.

SQL> /
Enter value for sid: 10003
Enter value for pid: 20003
Enter value for cost: 30
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10003, '20003','30')

1 row created.

SQL> /
Enter value for sid: 10004
Enter value for pid: 20003
Enter value for cost: 40
old   1: insert into CATALOG values(&sid, '&pid','&cost')
new   1: insert into CATALOG values(10004, '20003','40')

1 row created.

SQL> select * from CATALOG;

       SID        PID       COST
---------- ---------- ----------
     10001      20001         10
     10001      20002         10
     10001      20003         30
     10001      20004         10
     10001      20005         10
     10002      20001         10
     10002      20002         20
     10003      20003         30
     10004      20003         40

9 rows selected.


i)	Find the pnames of parts for which there is some supplier.

SQL> SELECT DISTINCT P.pname
2  FROM Parts P, Catalog C
3  WHERE P.pid = C.pid;

PNAME
--------------------
Book
Charger
Mobile
Pen
Pencil

ii)	Find the snames of suppliers who supply every part.

SQL> SELECT S.sname
2  FROM Suppliers S
3  WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P)
  4          MINUS (SELECT C.pid FROM Catalog C
  5          WHERE C.sid = S.sid));

SNAME
--------------------
Acme Widget

iii)	Find the snames of suppliers who supply every red part.

SQL>SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = ‘Red’ )
			MINUS
			( SELECT C.pid
			FROM Catalog C, Parts P
			WHERE C.sid = S.sid AND
			C.pid = P.pid AND P.color = ‘Red’ ));
SNAME
--------------------
Acme Widget
Johns

iv)	Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.

 

PNAME
--------------------
Mobile
Charger

v)	Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over all the suppliers who supply that part).

SQL> SELECT DISTINCT C.sid FROM Catalog C
2  WHERE C.cost > ( SELECT AVG (C1.cost)
3  FROM Catalog C1
4  WHERE C1.pid = C.pid );

       SID
----------
     10002
     10004
vi)	For each part, find the sname of the supplier who charges the most for that part.

SQL>SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX (C1.cost)
		FROM Catalog C1
		WHERE C1.pid = P.pid);

PID SNAME
---------- --------------------
20001 Acme Widget
20004 Acme Widget
20005 Acme Widget
     20001 Johns
     20002 Johns
20003 Reliance
