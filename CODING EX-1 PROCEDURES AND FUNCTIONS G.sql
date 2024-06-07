create database metro_prcoedures_and_fuctions1;

 use metro_prcoedures_and_fuctions1;

CREATE TABLE route (
    id INT PRIMARY KEY,
    route_name VARCHAR(255)
);

CREATE TABLE station (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    locality VARCHAR(100),
    is_interchange TINYINT
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
    forward TINYINT,
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


INSERT INTO route (id, route_name) VALUES
(1, 'North East line'),
(2, 'Circle line'),
(3, 'East Coast line'),
(4, 'West Coast line');

INSERT INTO station (id, name, locality, is_interchange) VALUES
(1, 'Station A', 'Locality 1', 0),
(2, 'Station B', 'Locality 2', 1),
(3, 'Station C', 'Locality 3', 0),
(4, 'Station D', 'Locality 4', 0);

INSERT INTO station_route (id, station_id, route_id, position) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 1),
(4, 4, 2, 2);

INSERT INTO metro_train (id, route_id, position, updated_time, forward) VALUES
(1001, 1, 1, '2023-06-01 10:00:00', 1),
(1002, 1, 2, '2023-06-01 10:15:00', 1),
(1003, 2, 1, '2023-06-01 10:30:00', 1),
(1004, 2, 2, '2023-06-01 10:45:00', 1);

INSERT INTO train_schedule (id, metro_train_id, station_id, scheduled_time) VALUES
(1, 1001, 1, '2023-06-01 10:05:00'),
(2, 1002, 2, '2023-06-01 10:20:00'),
(3, 1003, 3, '2023-06-01 10:35:00'),
(4, 1004, 4, '2023-06-01 10:50:00');

INSERT INTO train_arrival_time (id, metro_train_id, station_id, train_schedule_id, actual_time, deviation) VALUES
(1, 1001, 1, 1, '2023-06-01 10:06:00', 1),
(2, 1002, 2, 2, '2023-06-01 10:22:00', 2),
(3, 1003, 3, 3, '2023-06-01 10:40:00', 5),
(4, 1004, 4, 4, '2023-06-01 10:55:00', 5);

INSERT INTO travel_card (id, person_name, contact_number, balance) VALUES
(1, 'Alex', '1234567890', 50.0),
(2, 'Bob', '0987654321', 20.0),
(3, 'Charlie', '1122334455', 30.0),
(4, 'David', '5566778899', 15.0);

INSERT INTO travel_payment (id, travel_card_id, entry_station_id, entry_time, exit_station_id, exit_time, amount) VALUES
(1, 1, 1, '2017-12-22 11:20:15', 2, '2017-12-22 11:45:15', 30.0),
(2, 2, 3, '2017-12-22 12:20:15', 4, '2017-12-22 12:45:15', 10.0),
(3, 3, 1, '2017-12-22 13:20:15', 3, '2017-12-22 13:45:15', 20.0),
(4, 4, 2, '2017-12-22 14:20:15', 1, '2017-12-22 14:45:15', 15.0);

#QUESTION 1

#Create a procedure named 'insertRoute' which has route_name as an input parameter with varchar(255) as its datatype. This procedure should take the count of the existing table records(route table) and add 1 with that to generate the new route id. The newly generated id along with the route_name should be inserted into the route table.
#In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.
#Hints:
#Procedure name: insertRoute
#Parameters: route_name(varchar(255))
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the procedure is created successfully.
#id, route_name 

#answer 1

DELIMITER $$
CREATE PROCEDURE insertRoute(IN route_name VARCHAR(255))
BEGIN
    DECLARE id_value INT;
    SELECT IFNULL(MAX(id), 0) + 1 INTO id_value FROM route; 
    INSERT INTO route (id, route_name) VALUES (id_value, route_name);
END$$
DELIMITER ;
CALL insertRoute('EAST COAST LINE');
CALL insertRoute('WEST COAST LINE');

SELECT * FROM route;


#QUESTION 2

#Create a function named 'findRoute' which has the metroTrainId as the input parameter and it should return the route name of the train.
#Design Rules:
#If there is a route name for a given metro train id then it should return the corresponding route name
#In Solution, write a function alone with the given specifications. The calling of the function with the input will be taken care of in the back end.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the function is created successfully.
#route_name

#answer2

DELIMITER $$
CREATE FUNCTION findRoute(metroTrainId INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE g VARCHAR(255);
    SELECT route_name INTO g
    FROM route
    JOIN metro_train ON route.id = metro_train.route_id
    WHERE metro_train.id = metroTrainId
    LIMIT 1;
    RETURN g;
END$$
DELIMITER ;

SELECT findRoute(1005) AS route_name;



#QUESTION 3

#Create a function named 'findTheScheduledTime' which has the metroTrainId as the input parameter and it should return the scheduled time of the train.
#In Solution, write a function alone with the given specifications. The calling of the function with the input will be taken care of in the back end.
#Hints:
#Function Name: findTheScheduledTime
#Input parameter: metroTrainId (int)
#Design Rules:
#If there is a metro train id then it should return at the scheduled time of that train
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the function is created successfully.
#scheduled_time 

#answer 3

DELIMITER $$

CREATE FUNCTION findTheScheduledTime(metroTrainId INT) 
RETURNS DATETIME 
DETERMINISTIC
READS SQL DATA
BEGIN 
    DECLARE g DATETIME; 
    SELECT scheduled_time INTO g 
    FROM train_schedule 
    WHERE metro_train_id = metroTrainId
    LIMIT 1; 
    RETURN g; 
END$$
DELIMITER ;

SELECT findTheScheduledTime(1006) AS scheduled_time;


#QUESTION 4

#Create a procedure named 'findAmount' which takes 2 input parameters namely, personName varchar(100), entryTime date time, and 1 output parameter namely, amount_out double. This procedure should find the amount for the travel_payment made by the person whose name is passed as an input parameter.
#In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.
#Hints:
#Procedure name: findAmount
#Parameters: personName(varchar(100)), entryTime(datetime), amount_out(double)
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the procedure is created successfully.
#amount 

#answer 4

DELIMITER $$
CREATE PROCEDURE findAmount(
    IN personName VARCHAR(100),
    IN entryTime DATETIME,
    OUT amount_out DOUBLE
)
BEGIN
    SELECT amount INTO amount_out 
    FROM travel_payment A
    JOIN travel_card B ON A.travel_card_id = B.id
    WHERE B.person_name = personName AND A.entry_time = entryTime;
END$$
DELIMITER ;

CALL findAmount('Alex', '2017-12-22 11:20:15', @amount_out);
SELECT @amount_out AS amount;


