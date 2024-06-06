create database metro_train_views2;
use metro_train_views2;

CREATE TABLE route (
    id INT PRIMARY KEY,
    route_name VARCHAR(255)
);

CREATE TABLE train_schedule (
    id INT PRIMARY KEY,
    metro_train_id INT,
    station_id INT,
    scheduled_time DATETIME
);

CREATE TABLE travel_payment (
    id INT PRIMARY KEY,
    travel_card_id INT,
    entry_station_id INT,
    entry_time DATETIME,
    exit_station_id INT,
    exit_time DATETIME,
    amount DOUBLE
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

CREATE TABLE train_arrival_time (
    id INT PRIMARY KEY,
    metro_train_id INT,
    station_id INT,
    train_schedule_id INT,
    actual_time DATETIME,
    deviation INT
);

CREATE TABLE travel_card (
    id INT PRIMARY KEY,
    person_name VARCHAR(100),
    contact_number VARCHAR(100),
    balance DOUBLE
);

CREATE TABLE metro_train (
    id INT PRIMARY KEY,
    route_id INT,
    position INT,
    updated_time DATETIME,
    forward TINYINT(1),
    FOREIGN KEY (route_id) REFERENCES route(id)
);


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


-- question -1
-- Create a view named 'travel_payment_details' to display the details of the travel_payment having a payment amount greater than 30.
-- The input tables are populated in the backend. 

-- Output Format
-- The output will have the below header if the view is created successfully.
-- All the columns from the travel_payment table. Column names as per ER diagram.

CREATE VIEW travel_payment_details AS
SELECT * 	
FROM travel_payment
WHERE amount > 30;

select * from travel_payment_details;
-- question -2
-- Create a view named 'train_details_with_deviation' to display the metro train id, position and updated time of all the trains having deviation.
-- While selecting the result set, make sure to remove the duplicate rows.
-- Input Format
-- The input tables are populated in the backend. 

-- Output Format
-- The output will have the below header if the view is created successfully.
-- id, position, updated_time

CREATE VIEW train_details_with_deviation
AS 
SELECT A.id, A.position, A.updated_time
FROM
metro_train A
JOIN
train_arrival_time B
ON A.id = B.metro_train_id AND B.deviation > 0
GROUP By 1,2,3;

SELECT * FROM train_details_with_deviation;

-- question -3
-- Create a view named 'travel_card_details' to display all the details of travel_card.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The output will have the below header if the view is created successfully.
-- id, person_name, contact_number, balance 

CREATE VIEW station_details_with_no_interchanges AS
SELECT name, locality FROM station
WHERE is_interchange = 0;

SELECT * FROM station_details_with_no_interchanges ;

-- question-4
-- Create a view named 'station_details_with_no_interchanges' to display the name and locality of the stations with no interchanges.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The output will have the below header if the view is created successfully.
-- name, locality

CREATE VIEW rakesh  AS
SELECT name, locality FROM station
WHERE is_interchange = 0;

SELECT * FROM rakesh;





