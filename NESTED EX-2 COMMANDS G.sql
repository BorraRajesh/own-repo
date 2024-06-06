create database electricity_bill;
use electricity_bill;
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

CREATE TABLE slab (
    id INT PRIMARY KEY,
    connection_type_id INT,
    from_unit INT,
    to_unit INT,
    rate DOUBLE,
    FOREIGN KEY (connection_type_id) REFERENCES electricity_connection_type(id)
);

CREATE TABLE electricity_reading (
    id INT PRIMARY KEY,
    meter_id INT,
    day DATE,
    h1 INT, h2 INT, h3 INT, h4 INT, h5 INT, h6 INT, h7 INT, h8 INT, h9 INT, h10 INT, h11 INT, h12 INT,
    h13 INT, h14 INT, h15 INT, h16 INT, h17 INT, h18 INT, h19 INT, h20 INT, h21 INT, h22 INT, h23 INT, h24 INT,
    total_units INT,
    FOREIGN KEY (meter_id) REFERENCES meter(id)
);

CREATE TABLE bill (
    id INT PRIMARY KEY,
    meter_id INT,
    month INT,
    year INT,
    due_date DATE,
    total_units INT,
    payable_amount DOUBLE,
    is_payed TINYINT(1),
    payment_date DATE,
    fine_amount DOUBLE,
    FOREIGN KEY (meter_id) REFERENCES meter(id)
);

-- Insert into electricity_connection_type
INSERT INTO electricity_connection_type (id, connection_name) VALUES
(1, 'Residential'),
(2, 'Commercial');

-- Insert into building_type
INSERT INTO building_type (id, name, connection_type_id) VALUES
(1, 'Library', 1),
(2, 'Police Station', 2);

-- Insert into building
INSERT INTO building (id, owner_name, address, building_type_id, contact_number, email_address) VALUES
(1, 'Alice Johnson', '123 Main St', 1, '555-1234', 'alice@example.com'),
(2, 'Bob Smith', '456 Elm St', 2, '555-5678', 'bob@example.com'),
(3, 'Charlie Davis', '789 Oak St', 1, '555-8765', 'charlie@example.com'),
(4, 'Diana Brown', '101 Pine St', 2, '555-4321', 'diana@example.com');

-- Insert into meter
INSERT INTO meter (id, meter_number, building_id) VALUES
(1, 'SG824012', 1),
(2, 'SG934826', 2),
(3, 'SG135792', 3),
(4, 'SG246810', 4);

-- Insert into slab
INSERT INTO slab (id, connection_type_id, from_unit, to_unit, rate) VALUES
(1, 1, 0, 100, 0.10),
(2, 1, 101, 200, 0.15),
(3, 2, 0, 100, 0.20),
(4, 2, 101, 200, 0.25);

-- Insert into electricity_reading
INSERT INTO electricity_reading (id, meter_id, day, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12,
    h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, total_units) VALUES
(1, 1, '2024-06-01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 24),
(2, 2, '2024-06-01', 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 48),
(3, 3, '2024-06-01', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 72),
(4, 4, '2024-06-01', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 96);

-- Insert into bill
INSERT INTO bill (id, meter_id, month, year, due_date, total_units, payable_amount, is_payed, payment_date, fine_amount) VALUES
(1, 1, 6, 2024, '2024-06-30', 24, 2.40, 1, '2024-06-15', NULL),
(2, 2, 6, 2024, '2024-06-30', 48, 9.60, 1, '2024-06-20', NULL),
(3, 3, 6, 2024, '2024-06-30', 72, 10.80, 0, NULL, 1.00),
(4, 4, 6, 2024, '2024-06-30', 96, 24.00, 0, NULL, 2.00);

#QUESTION 1

#Write a query to display all the building details in which the building type is ‘Library’. Display the records in ascending order based on their owner_name.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#id, owner_name, address, building_type_id, contact_number, email_address 

select *
from building
where building_type_id = (select id from building_type where name = 'Library')
order by owner_name asc;

#QUESTION 2

#Write a query to display all the contact numbers of the building type 'Police Station'. Display the records in ascending order based on the contact number.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#contact_number 

select contact_number
from building
where building_type_id = (select id from building_type where name = 'Police Station')
order by contact_number asc;

#QUESTION 3
#Write a query to display the building type name of the meter number 'SG824012'.

#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#name

select name
from building_type
where id = (select building_type_id from building where id = (select building_id from meter where meter_number = 'SG824012'));

#QUESTION 4

#Write a query to display the total units and payable amount of the particular meter number 'SG934826'.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#total_units, payable_amount
 
select total_units, payable_amount
from bill
where meter_id = (select id from meter where meter_number = 'SG934826');

#QUESTION 5

#Write a query to display the number of buildings that have been charged for a fine amount. Give an alias name as 'building_count'.
#Input Format
#The input tables are populated in the backend. 
#Output Format
#Follow the below output header for the query to be considered.
#building_count  

select count(id) AS building_count
from building
where id in (select building_id from meter where id in 
           (select meter_id from bill where not 
           fine_amount is null));