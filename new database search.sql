drop database try;
create database try;
use try;

create table client (

client_name varchar(40) not null ,
age int not null,
 job varchar(40) not null,
  address varchar(40) not null,
 email varchar(40) not null,
 client_id  int not null primary key,
 Room_id int  not null );
 create table Room (
Room_id  int not null primary key,
floor int not null,
capacity varchar(40) not null,
client_id  int (40) not null );
create table Reservation (
id  int not null primary key,
check_in date null,
check_out date not null,
room_id int  not null,
client_id int not null );
alter table room add foreign key (client_id) references client(client_id);
alter table reservation add foreign key (client_id) references client(client_id);
alter table reservation add foreign key (room_id) references room(room_id);                
/*insert statements*/
insert into client values("MohamedAliSami",	26,	"lawyer",	"Giza",	"mohamed@gmail.com"	,1	,1 );
insert into client values("Mohamed Atif",	28	,"Engineer"	,"Cairo"	,"atif@gmail.com",	2,	2);
insert into client values("Sami Ali"	,33,"	doctor",	"Tanta",	"sami@gmail.com"	,3	,4);
insert into client values("Mostafa Osama"	,35,	"officer",	"Sinai"	,"mostafa@gmail.com"	,4,	3);
insert into Room values(1,	2,	"single" ,	1); 
insert into Room values(2,	3,	"Double",	2);
insert into Room values(3,	4,	"Single"	,4);
insert into Room values(4,	5,	"double",	3);
insert into Reservation values (100	 , "2020/12/25"   ,"2020/12/27",1,1);
insert into Reservation values (200,	"2020/11/13"	,"2020/11/25",2,2);
insert into Reservation values (300,	"2020/2/22"   ,	"2020/3/2",3,4);

/*select statements*/

select Room_id from client where client_name = "Mohamed Atif";
Select client_id from client where client_name = "Sami Ali";
Select*from client;
Select client_id from client where job= "lawyer";
Select client_name from client where age =26;
Select Room_id from Room where capacity = "single";
Select Room_id from Room where capacity = "double";
Select client_name from client;
Select Room_id from Room where client_id=4;
Select floor from Room where capacity= "single";
Select Room_id from Room where floor=2;
Select capacity from room where room_id=1;
Select address from client where client_id=4;
select *from reservation;
Select client_id from client where address= "Tanta";
Select client_name from client where client_id>1;
Select client_id from client where room_id=1 and address="Giza";
Select client_id from client having client_id >4;
SELECT COUNT(client_id) FROM client;
Select client_id from client where room_id=1 union select client_id from client where room_id=2;
select max(room_id) from room;
select min(room_id) from room;
select distinct(Room_id) from room;
/*sub query*/
Select * from client where client_id in (select client_id from client where job= "lawyer");
Select * from room where room_id > Any (select client_id from client where address= "Tanta");
Select * from room where room_id = (select Room_id from client where age=26);


/*count and group funcations*/
select count(*) from client;
select client_id from client group by Room_id;


/*Joins*/
select * from client inner join room on client.room_id=room.room_id;
select client.client_name, client.age, room.room_id from client Left join room on client.client_id=room.client_id;
select client.client_name, client.address, room.room_id from client right join room on client.client_id=room.client_id;
select *from client cross join room on client.client_id=room.client_id;
select client.client_name, client.age, room.room_id from client join room on client.client_id=room.client_id;

/*update statements*/

update client set client_id=10 where client_id=4;
update client set client_id=20 where client_id=2;
update client set client_id=30 where client_id=3;
update client set client_id=40 where client_id=1;
update room set floor=1 where floor=5;

/* delete statement*/
DELETE FROM client WHERE client_id=4;
DELETE FROM client WHERE client_id=3;
DELETE FROM room WHERE floor=5;
DELETE FROM room WHERE room_id=2;
DELETE FROM reservation WHERE id=100;
