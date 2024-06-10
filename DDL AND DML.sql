create database pet_adoptions;

use pet_adoptions;

create table adoptions(
animal_id int not null,
name varchar(40),
contact varchar(40)
);

select *from adoptions;

create table animals(
id int not null,
name varchar(40),
breed varchar(30),
color varchar(30),
gender varchar(10),
status int
);

select  *from animals;

insert into animals(id,name,breed,color,gender,status) values(501,'Bellyflop','Beagle','Brown','Male',0);
insert into animals(id,name,breed,color,gender,status) values(502,'Snowy','Husky','White','Female',0);
insert into animals(id,name,breed,color,gender,status) values(503,'Princes','Pomarnian','Black','Female',0);
insert into animals(id,name,breed,color,gender,status) values(504,'Cricket','Chihuahua','Brown','Female',0);
insert into animals(id,name,breed,color,gender,status) values(505,'Spot','Dalmation','Black and White','Male',0);
insert into animals values(506,'name','fg','','',0);

select id,breed from animals;
select name from animals where gender='Female';
select id from animals where status=0;

update animals set color='Brown and red' where name='Spot';
update animals set gender='Red' where id=501;
update animals set breed="german shepard" where gender ="Male";
update animals set status=1 where gender='Female';

select id,breed from animals;
select name from animals where gender='Female';
select id from animals where status=0;

update animals set color='Brown and red' where name='Spot';
update animals set gender='Red' where id=501;
update animals set status=1 where gender='Female';

delete from animals where color='Black';
delete from animals where color="black";

select *from animals;
insert into adoptions(animal_id,name,contact) values(101,'Pinnochio','pinnocchio@gmail.com');
select *from adoptions;

alter table animals drop column colour;

ALTER TABLE adoptions RENAME COLUMN name TO Fname;
alter table animals rename column color to colour; 

insert into adoptions(animal_id,name,contact) values(102,'Stella','Stella@gmail.com');
insert into adoptions(animal_id,name,contact) values(103,'Bob','bob@gmail.com');
insert into adoptions(animal_id,name,contact) values(104,'alex','alex@gmail.com');
insert into adoptions(animal_id,name,contact) values(105,'sunny','sunny@gmail.com');

select *from animals;
select  *from  adoptions;
select *from animals 
order by id asc;
select id from animals order by id desc;
select *from animals 
order by color desc;

alter table animals drop status  ;
alter table animals add species varchar(20);

select *from animals;
update animals set species='Dog';

insert into animals values(401,'Meowcat1','asian','Male',0,'pig'),
(402,'Meowcat2','africa','Female',0,'Buffallo'),
(403,'Meowcat3','africa','FeMale',0,'elephant'),
(404,'Meowcat4','bengal','Male',0,'Cat');

select *from animals
order by id desc;

create table shelter(
id int primary key,
name varchar(50),
location varchar(50)
);

insert into shelter(id,name,location) values (1,'Animals for Homes','Smart city');
select *from shelter;
alter table shelter rename column name to sheltername ;

select *from animals;
update animals set shelter=1;
insert into shelter(id,sheltername,location) values(2,'Adopt animals','Green Town');
insert into shelter(id,sheltername,location) values(3,'Give Life','Blue Hills');

select *from shelter;
select *from shelter 
order by id desc;

help adoptions;
select *from animals;
alter table animals add age_of_species int;
help animals;
describe animals;
alter table shelter drop column location;

select *from animals;

create table studentdata(
name varchar(20),
age int
);

delete from animals where  species='Dog';
ALTER TABLE shelter
DROP  id;
SELECT * FROM animals
WHERE id BETWEEN 500 AND 505;

CREATE TABLE Persons (
    Age int,
    CHECK (Age>=18)
);

insert into Persons  values(45);
insert into Persons  values(16);
insert into Persons  values(9);
insert into Persons  values(99);
insert into Persons  values(18);

select * from Persons;
ALTER TABLE Persons
ADD CHECK (Age>=18);
DELETE FROM animals
WHERE id=501;
alter table animals rename column name to sportname;
select sportname from animals;
update animals set sportname="cricket" where  status=0;
alter table animals drop column sportname;

insert into shelter(id,sheltername,location) values (8,'Animals for Homes','Smart city');
select *from shelter;
insert into shelter(id,sheltername,location) values(9,'Adopt animals','Green Town');

