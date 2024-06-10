create database pet_adoption;
use pet_adoption;
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
select id,breed from animals;

insert into animals(id,name,breed,color,gender,status) values(501,'Bellyflop','Beagle','Brown','Male',0);
insert into animals(id,name,breed,color,gender,status) values(502,'Snowy','Husky','White','Female',0);
insert into animals(id,name,breed,color,gender,status) values(503,'Princes','Pomarnian','Black','Female',0);
insert into animals(id,name,breed,color,gender,status) values(504,'Cricket','Chihuahua','Brown','Female',0);
insert into animals(id,name,breed,color,gender,status) values(505,'Spot','Dalmation','Black and White','Male',0);
select name from animals where gender='Female';
select id from animals where status=0;
select name from animals where id < 503;
update animals set color='white' where name='Spot';
select  *from animals;
insert into adoptions(animal_id,name,contact) values(101,'Pinnochio','pinnocchio@gmail.com');
insert into adoptions(animal_id,name,contact) values(102,'Stella','Stella@gmail.com');
insert into adoptions(animal_id,name,contact) values(103,'Bob','bob@gmail.com');
insert into adoptions(animal_id,name,contact) values(104,'alex','alex@gmail.com');
insert into adoptions(animal_id,name,contact) values(105,'sunny','sunny@gmail.com');
select contact from adoptions;
select * from adoptions;
select * from animals order by status desc;
select id from animals order by id ;
alter table animals drop column gender;
select * from animals;
alter table animals add species varchar(200);
update animals set status=5 WHERE id=502; 
alter table animals add age_of_species int;
help adoptions;
create table shelter(
id int,
name varchar(50),
location varchar(50)
);
insert into shelter(id,name,location) values (1,'Animals for Homes','Smart city');
select *from shelter;
insert into shelter(id,name,location) values(2,'Adopt animals','Green Town');
