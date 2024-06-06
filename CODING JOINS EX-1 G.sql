 create database mt;
 use mt;
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
(2, 'Downtown line'),
(3, 'North East line'),
(4, 'Circle line');

-- Insert into station
INSERT INTO station (id, name, locality, is_interchange) VALUES
(1, 'Station A', 'Locality A', 1),
(2, 'Station B', 'Locality B', 0),
(3, 'Station C', 'Locality C', 1),
(4, 'Station D', 'Locality D', 0),
(5, 'Station E', 'Locality E', 0),
(6, 'Station F', 'Locality F', 0);

-- Insert into station_route
INSERT INTO station_route (id, station_id, route_id, position) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 1),
(4, 4, 2, 2),
(5, 5, 3, 1),
(6, 6, 4, 1);

-- Insert into metro_train
INSERT INTO metro_train (id, route_id, position, updated_time, forward) VALUES
(1, 1, 1, '2024-06-01 08:00:00', 1),
(2, 1, 2, '2024-06-01 09:00:00', 1),
(3, 2, 1, '2024-06-01 10:00:00', 0),
(4, 2, 2, '2024-06-01 11:00:00', 0),
(5, 3, 1, '2024-06-01 12:00:00', 1),
(6, 4, 1, '2024-06-01 13:00:00', 1);

-- Insert into train_schedule
INSERT INTO train_schedule (id, metro_train_id, station_id, scheduled_time) VALUES
(1, 1, 1, '2017-12-21 08:00:00'),
(2, 2, 2, '2017-12-21 09:00:00'),
(3, 3, 3, '2017-12-21 10:00:00'),
(4, 4, 4, '2017-12-21 11:00:00'),
(5, 5, 5, '2017-12-21 12:00:00'),
(6, 6, 6, '2017-12-21 13:00:00');

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
(1, 1, 1, '2017-12-23 08:00:00', 5, '2017-12-23 08:30:00', 30.0),
(2, 2, 2, '2017-12-23 09:00:00', 6, '2017-12-23 09:30:00', 35.0),
(3, 3, 3, '2017-12-23 10:00:00', 4, '2017-12-23 10:30:00', 1.5),
(4, 4, 4, '2017-12-23 11:00:00', 3, '2017-12-23 11:30:00', 2.0),
(5, 1, 1, '2017-12-23 12:00:00', 2, '2017-12-23 12:30:00', 20.0),
(6, 2, 2, '2017-12-23 13:00:00', 3, '2017-12-23 13:30:00', 25.0);


#QUESTION 1
#Write a query to display the names and contact numbers of persons whose destination station is on the route 'North East line' with a payment of more than 25. Display the records in ascending order based on person's name.
#Input Format
#The input tables are populated in the backend
#Output Format
#Follow the below output header for the query to be considered..
#person_name, contact_number 

SELECT person_name, contact_number
FROM 
travel_card A JOIN travel_payment B
ON A.id = B.travel_card_id
JOIN
station C ON B.exit_station_id = C.id
JOIN
station_route D ON C.id = D.station_id
JOIN route E ON E.id = D.route_id
WHERE E.route_name = 'North East line'
AND B.amount > 25
ORDER BY 1;

#QUESTION 2

#Write a query to display the name and locality of the stations with the metro trains scheduled to arrive on '2017-12-21' along the route 'Circle line'. Display the records in ascending order based on the station name.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#name, locality

SELECT name, locality
FROM
station A
JOIN train_schedule B On A.id = B.station_id
JOIN station_route C ON A.id = C.station_id
JOIN route D ON D.id = C.route_id
WHERE route_name = 'Circle line'
AND B.scheduled_time LIKE '2017-12-21%'
ORDER BY 1;

#QUESTION 3

#Write a query to display a person's name, contact number, and balance details, who have a minimum balance on their travel_card. If there are multiple records, display the record in descending order by person name.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#person_name, contact_number, balance

SELECT person_name, contact_number, balance
FROM
travel_card
WHERE balance in
(SELECT min(balance) FROM travel_card)
ORDER BY 1 DESC;

#QUESTION 4

#Write a query to display the person's name, contact number, balance, entry_time, and exit_time of all the details, who has the second highest balance on their travel cards. Display the records in ascending order based on their person_name.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#person_name, contact_number, balance, entry_time, exit_time 

SELECT A.person_name, A.contact_number, A.balance, 
B.entry_time, B.exit_time
FROM 
travel_card A 
JOIN travel_payment B
ON A.id = B.travel_card_id
WHERE balance =
(SELECT distinct balance FROM
 travel_card t1
 WHERE 2 = (SELECT COUNT(DISTINCT balance)
            FROM travel_card t2
            WHERE t2.balance >= t1.balance))
ORDER BY 1;

#QUESTION 5

#Write a query to display the person's name, contact number, and balance of all the travelers, who traveled for a maximum number of times. If there are multiple records then display the records in descending order by person name.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#person_name, contact_number, balance

SELECT person_name, contact_number, balance 
FROM travel_card A JOIN 
(SELECT travel_card_id, count(*) as times 
 FROM travel_payment group by 1 ) B 
ON A.id = B.travel_card_id
WHERE B.times = 2 ORDER By 1 DESC;