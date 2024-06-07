create database electicity_procedure_and_function2;

use electicity_procedure_and_function2 ;

CREATE TABLE electricity_connection_type (
    id INT PRIMARY KEY,
    connection_name VARCHAR(20)
);

CREATE TABLE building_type (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    connection_type_id INT,
    FOREIGN KEY (connection_type_id) REFERENCES electricity_connection_type(id)
);

CREATE TABLE building (
    id INT PRIMARY KEY,
    owner_name VARCHAR(100),
    address VARCHAR(100),
    building_type_id INT,
    contact_number VARCHAR(100),
    email_address VARCHAR(100),
    FOREIGN KEY (building_type_id) REFERENCES building_type(id)
);

CREATE TABLE meter (
    id INT PRIMARY KEY,
    meter_number VARCHAR(100),
    building_id INT,
    FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE electricity_reading (
    id INT PRIMARY KEY,
    meter_id INT,
    day DATE,
    h1 INT, h2 INT, h3 INT, h4 INT, h5 INT, h6 INT, h7 INT, h8 INT, h9 INT, h10 INT, h11 INT, h12 INT,
    h13 INT, h14 INT, h15 INT, h16 INT, h17 INT, h18 INT, h19 INT, h20 INT, h21 INT, h22 INT, h23 INT, h24 INT,
    total_units int
);



CREATE TABLE bill (
    id INT PRIMARY KEY,
    meter_id INT,
    month INT,
    year INT,
    due_date DATE,
    total_units INT,
    payable_amount DOUBLE,
    is_payed INT,
    payment_date DATE,
    fine_amount DOUBLE,
    FOREIGN KEY (meter_id) REFERENCES meter(id)
);

CREATE TABLE slab (
    id INT PRIMARY KEY,
    connection_type_id INT,
    from_unit INT,
    to_unit INT,
    rate DOUBLE,
    FOREIGN KEY (connection_type_id) REFERENCES electricity_connection_type(id)
);

-- Inserting into electricity_connection_type table
INSERT INTO electricity_connection_type (id, connection_name) VALUES 
(1, 'Residential'), 
(2, 'Commercial'), 
(3, 'Industrial'), 
(4, 'Agricultural'), 
(5, 'Public Services'), 
(6, 'Temporary'), 
(7, 'Non-Residential'), 
(8, 'Government'), 
(9, 'Private Services'), 
(10, 'Educational');

-- Inserting into building_type table
INSERT INTO building_type (id, name, connection_type_id) VALUES 
(1, 'Apartment', 1), 
(2, 'Office', 2), 
(3, 'Factory', 3), 
(4, 'Farm', 4), 
(5, 'School', 10), 
(6, 'Hospital', 8), 
(7, 'Warehouse', 3), 
(8, 'Library', 10), 
(9, 'Store', 2), 
(10, 'Mall', 2);

INSERT INTO electricity_reading (id, meter_id, day, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, total_units) VALUES
(1, 1, '2023-06-01', 10, 12, 15, 14, 13, 16, 20, 22, 25, 30, 28, 27, 26, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 478),
(2, 2, '2023-06-01', 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 656),
(3, 1, '2023-06-02', 11, 13, 16, 15, 14, 17, 21, 23, 26, 31, 29, 28, 27, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 488),
(4, 2, '2023-06-02', 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 704),
(5, 3, '2023-06-01', 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 598),
(6, 3, '2023-06-02', 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 560),
(7, 1, '2023-06-03', 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 510);


-- Inserting into building table
INSERT INTO building (id, owner_name, address, building_type_id, contact_number, email_address) 
VALUES 
(1, 'John Doe', '123 Maple St', 1, '123-456-7890', 'john@example.com'), 
(2, 'Jane Smith', '456 Oak St', 2, '098-765-4321', 'jane@example.com'),
(3, 'Alice Johnson', '789 Pine St', 3, '111-222-3333', 'alice@example.com'),
(4, 'Bob Brown', '101 Birch St', 4, '444-555-6666', 'bob@example.com'),
(5, 'Charlie Davis', '202 Cedar St', 5, '777-888-9999', 'charlie@example.com'),
(6, 'Diana Green', '303 Spruce St', 6, '000-111-2222', 'diana@example.com'),
(7, 'Edward Harris', '404 Fir St', 7, '333-444-5555', 'edward@example.com'),
(8, 'Fiona Lee', '505 Elm St', 8, '666-777-8888', 'fiona@example.com'),
(9, 'George Martin', '606 Willow St', 9, '999-000-1111', 'george@example.com'),
(10, 'Hannah White', '707 Maple St', 10, '222-333-4444', 'hannah@example.com'),
(11, 'Hannah jefjejd White', '707 Maple St', 10, '222-333-4444', 'hannah@example.com');

-- Inserting into meter table
INSERT INTO meter (id, meter_number, building_id) VALUES 
(1, 'MTR123', 1), 
(2, 'MTR456', 2),
(3, 'MTR789', 3),
(4, 'MTR101', 4),
(5, 'MTR112', 5),
(6, 'MTR131', 6),
(7, 'MTR415', 7),
(8, 'MTR161', 8),
(9, 'MTR718', 9),
(10, 'MTR920', 10);

-- Inserting into bill table
INSERT INTO bill (id, meter_id, month, year, due_date, total_units, payable_amount, is_payed, payment_date, fine_amount)
VALUES 
(1, 1, 5, 2024, '2024-06-05', 100, 150.50, 1, '2024-06-10', 0), 
(2, 2, 5, 2024, '2024-06-05', 200, 300.75, 0, NULL, 15.00),
(3, 3, 5, 2024, '2024-06-05', 150, 225.00, 1, '2024-06-11', 0),
(4, 4, 5, 2024, '2024-06-05', 250, 375.50, 0, NULL, 20.00),
(5, 5, 5, 2024, '2024-06-05', 300, 450.00, 1, '2024-06-12', 0),
(6, 6, 5, 2024, '2024-06-05', 350, 525.50, 0, NULL, 25.00),
(7, 7, 5, 2024, '2024-06-05', 400, 600.00, 1, '2024-06-13', 0),
(8, 8, 5, 2024, '2024-06-05', 450, 675.50, 0, NULL, 30.00),
(9, 9, 5, 2024, '2024-06-05', 500, 750.00, 1, '2024-06-14', 0),
(10, 10, 5, 2024, '2024-06-05', 550, 825.50, 0, NULL, 35.00);

-- Inserting into slab table
INSERT INTO slab (id, connection_type_id, from_unit, to_unit, rate) VALUES 
(1, 1, 0, 100, 1.5), 
(2, 2, 101, 200, 2.5),
(3, 3, 201, 300, 3.5),
(4, 4, 301, 400, 4.5),
(5, 5, 401, 500, 5.5),
(6, 6, 501, 600, 6.5),
(7, 7, 601, 700, 7.5),
(8, 8, 701, 800, 8.5),
(9, 9, 801, 900, 9.5),
(10, 10, 901, 1000, 10.5);

#QUESTION 1

#Create a procedure named 'insertConnection' which has connection_name as an input parameter with varchar(100) as its datatype. This procedure will take the count of the existing table records(electricity_connection_type) and add 1 with that to generate the new electricity_connection_type id. The newly generated id along with the connection_name should be inserted into the electricity_connection_type table.
#In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.
#Hints:
#Procedure name: insertConnection
#Parameters: connection_name(varchar(100))
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the procedure is created successfully.
#id, connection_name  

#answer1 

DELIMITER $$
CREATE PROCEDURE insertConnection(IN connection_name VARCHAR(100))
BEGIN
DECLARE id_value int;
SELECT count(id) + 1 INTO id_value FROM electricity_connection_type;
INSERT INTO electricity_connection_type
VALUES
(id_value,connection_name);
END;

CALL insertConnection('Industrial');
CALL insertConnection('Small Scale');

SELECT * FROM electricity_connection_type;

#QUESTION 2

#Create a procedure named 'insertMeter' which takes 2 input parameters namely, meter_number varchar(100) and building_id int. This procedure will take the count of the existing table records(meter) and add 1 with that to generate the new meter id. The newly generated id along with the meter_number and building_id should be inserted into the meter table.
#In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.
#Hints:
#Procedure name: insertMeter
#Parameters: meter_number(varchar(100)),building_id(int)
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the procedure is created successfully.
#id, meter_number, building_id

#ANSWER 2

DELIMITER $$
CREATE PROCEDURE insertMeter
(IN meter_number VARCHAR(100),
IN building_id int)
BEGIN
DECLARE id_value int;
SELECT count(id) + 1 INTO id_value FROM meter;
INSERT INTO meter
VALUES
(id_value,meter_number,building_id);
END$$
DELIMITER ;

CALL insertMeter('SG11111', 3);
CALL insertMeter('SG22222', 4);

SELECT * FROM meter;

#QUESTION 3

#Create a procedure named 'findTotalUnits' which has meter_number as an input parameter with varchar(100) as its datatype. This procedure should display the total_units of the electricity_reading for the meter_number passed as a parameter.
#If there is more than one row for a particular meter number in the electricity_reading table for different dates, Output should display the sum of the total_units as total_units.
#In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.
#Hints:
#Procedure name: findTotalUnits
#Parameters: meter_number(varchar(100))
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the procedure is created successfully.
#total_units 

#ANSWER 3

DELIMITER $$
CREATE PROCEDURE findTotalUnits 
(IN meter_number VARCHAR(100)) 
BEGIN 
SELECT SUM(total_units) as total_units
FROM electricity_reading A 
JOIN meter B 
ON B.id = A. meter_id 
WHERE B.meter_number = meter_number; 
END$$
DELIMITER ;

CALL findTotalUnits('SG976232');


#QUESTION 4

#Create a function named 'findTotalUnits' which takes meterNumber as its input parameter and returns the total units consumed by the meter number for all the months.
#In Solution, write a function alone with the given specifications. The calling of function with the input will be taken care of in the back end.
#Design Rules:
#If the meterNumber passed as input matches with the meter_number in the table then it returns the total units for the given input.
#Hints:
#Function name: findTotalUnits
#nput parameter: meterNumber (varchar(255))
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the function is created successfully.
#total_units 

#ANSWER 4

DELIMITER $$
CREATE FUNCTION findTotalUnits (meterNumber VARCHAR(255)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalUnits INT;
    
    SELECT COALESCE(SUM(A.total_units), 0) INTO totalUnits
    FROM electricity_reading A
    JOIN meter B ON B.id = A.meter_id
    WHERE B.meter_number = meterNumber;
    RETURN totalUnits;
END$$
DELIMITER ;

SELECT findTotalUnits('SG923564') as total_units;

#QUESTION 5

#Create a function named 'findCountofBuildingType' which has the connectionName as its input parameter and it returns the count of the building type for the given input.
#In Solution, write a function alone with the given specifications. The calling of function with the input will be taken care of in the back end.
#Hints:
#Function Name: findCountofBuildingType
#Input parameter: connection_name (varchar(255))
#Return type: INT
#Design Rules:
#If the connectionName passed as input matches with the connection_name in the table then it returns the count of the building types for a given input.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#The output will display the below header if the function is created successfully.
#building_type_account

#ANSWER 5

DELIMITER $$
CREATE FUNCTION findCountofBuildingType (connection_name VARCHAR(255)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE countOfBuildingType INT;
    SELECT COUNT(A.id) INTO countOfBuildingType
    FROM building_type A
    JOIN electricity_connection_type B ON B.id = A.connection_Type_id
    WHERE B.connection_name = connection_name;
    RETURN countOfBuildingType;
END$$
DELIMITER ;

SELECT findCountofBuildingType('HOME') AS building_type_count;