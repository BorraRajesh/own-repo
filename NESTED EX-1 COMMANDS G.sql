create database METRO_TRAIN;
use METRO_TRAIN;
CREATE TABLE route (
    id INT PRIMARY KEY,
    route_name VARCHAR(255)
);

CREATE TABLE station (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    locality VARCHAR(100),
    is_interchange TINYINT(1)
);

CREATE TABLE station_route (
    id INT PRIMARY KEY,
    station_id INT,
    route_id INT,
    position INT,
    FOREIGN KEY (station_id) REFERENCES station(id),
    FOREIGN KEY (route_id) REFERENCES route(id)
);

CREATE TABLE metro_train (
    id INT PRIMARY KEY,
    route_id INT,
    position INT,
    updated_time DATETIME,
    forward TINYINT(1),
    FOREIGN KEY (route_id) REFERENCES route(id)
);

CREATE TABLE train_schedule (
    id INT PRIMARY KEY,
    metro_train_id INT,
    station_id INT,
    scheduled_time DATETIME,
    FOREIGN KEY (metro_train_id) REFERENCES metro_train(id),
    FOREIGN KEY (station_id) REFERENCES station(id)
);

CREATE TABLE train_arrival_time (
    id INT PRIMARY KEY,
    metro_train_id INT,
    station_id INT,
    train_schedule_id INT,
    actual_time DATETIME,
    deviation INT,
    FOREIGN KEY (metro_train_id) REFERENCES metro_train(id),
    FOREIGN KEY (station_id) REFERENCES station(id),
    FOREIGN KEY (train_schedule_id) REFERENCES train_schedule(id)
);

CREATE TABLE travel_card (
    id INT PRIMARY KEY,
    person_name VARCHAR(100),
    contact_number VARCHAR(100),
    balance DOUBLE
);

CREATE TABLE travel_payment (
    id INT PRIMARY KEY,
    travel_card_id INT,
    entry_station_id INT,
    entry_time DATETIME,
    exit_station_id INT,
    exit_time DATETIME,
    amount DOUBLE,
    FOREIGN KEY (travel_card_id) REFERENCES travel_card(id),
    FOREIGN KEY (entry_station_id) REFERENCES station(id),
    FOREIGN KEY (exit_station_id) REFERENCES station(id)
);

-- Insert into route
INSERT INTO route (id, route_name) VALUES
(1, 'East West line'),
(2, 'Downtown line');


-- Insert into station
INSERT INTO station (id, name, locality, is_interchange) VALUES
(1, 'Station A', 'Locality A', 1),
(2, 'Station B', 'Locality B', 0),
(3, 'Station C', 'Locality C', 1),
(4, 'Station D', 'Locality D', 0);

-- Insert into station_route
INSERT INTO station_route (id, station_id, route_id, position) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 1),
(4, 4, 2, 2);

-- Insert into metro_train
INSERT INTO metro_train (id, route_id, position, updated_time, forward) VALUES
(1, 1, 1, '2024-06-01 08:00:00', 1),
(2, 1, 2, '2024-06-01 09:00:00', 1),
(3, 2, 1, '2024-06-01 10:00:00', 0),
(4, 2, 2, '2024-06-01 11:00:00', 0);

-- Insert into train_schedule
INSERT INTO train_schedule (id, metro_train_id, station_id, scheduled_time) VALUES
(1, 1, 1, '2017-12-21 08:00:00'),
(2, 2, 2, '2017-12-21 09:00:00'),
(3, 3, 3, '2017-12-21 10:00:00'),
(4, 4, 4, '2017-12-21 11:00:00');

-- Insert into train_arrival_time
INSERT INTO train_arrival_time (id, metro_train_id, station_id, train_schedule_id, actual_time, deviation) VALUES
(1, 1, 1, 1, '2017-12-21 08:05:00', 5),
(2, 2, 2, 2, '2017-12-21 09:10:00', 10),
(3, 3, 3, 3, '2017-12-21 10:15:00', 15),
(4, 4, 4, 4, '2017-12-21 11:20:00', 20);

-- Insert into travel_card
INSERT INTO travel_card (id, person_name, contact_number, balance) VALUES
(1, 'John Doe', '555-1234', 50.0),
(2, 'Jane Smith', '555-5678', 30.0),
(3, 'Alice Johnson', '555-8765', 40.0),
(4, 'Bob Brown', '555-4321', 20.0);

-- Insert into travel_payment
INSERT INTO travel_payment (id, travel_card_id, entry_station_id, entry_time, exit_station_id, exit_time, amount) VALUES
(1, 1, 1, '2017-12-23 08:00:00', 2, '2017-12-23 08:30:00', 2.5),
(2, 2, 2, '2017-12-23 09:00:00', 1, '2017-12-23 09:30:00', 3.0),
(3, 3, 3, '2017-12-23 10:00:00', 4, '2017-12-23 10:30:00', 1.5),
(4, 4, 4, '2017-12-23 11:00:00', 3, '2017-12-23 11:30:00', 2.0);


#QUESTION 1
#Write a query to display all the train details that belong to the ‘East-West line’. Display the records in ascending order based on the updated_time.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#id, route_id, position, updated_time, forward


select *from metro_train
where route_id = (select id from route 
            where route_name='East West line') 
            order by updated_time;
            
            
#QUESTION 2

#Write a query to display the station details which belong to the route 'Downtown line'. Display the records in ascending order based on station_name.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#id, name, locality, is_interchange 


select *from station where id IN 
(select station_id from station_route where route_id = 
(select id from route where route_name='DOWNTOWN LINE')) order by name;


#QUESTION 3

#Write a query to display person name and contact number of all persons who traveled on 2017-12-23. Display the records in ascending order based on the person's name.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#person_name, contact_number

select person_name,  contact_number from travel_card
where id in 
(select travel_card_id from travel_payment 
            where day(entry_time)=23
              and month(entry_time)=12 
              and year(entry_time)=2017) order by person_name;


#QUESTION 4

#Write a query to display all the train details scheduled on '2017-12-21'. Display the records in ascending order based on position.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#id, route_id, position, updated_time, forward 

select *from metro_train where id in
(select metro_train_id from train_schedule where day(scheduled_time)=21
              and month(scheduled_time)=12 
              and year(scheduled_time)=2017) order by position;
              
              
#QUESTION 5

#Write a query to display the metro train id, position, and updated time of all the trains having deviation. Display the records in ascending order based on updated time.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#id, position, updated_time 

select id, position, updated_time
from metro_train
where id in (select metro_train_id from train_arrival_time where deviation > 0)
order by updated_time asc;