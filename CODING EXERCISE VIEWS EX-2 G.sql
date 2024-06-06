create database electicity_views2;

use electicity_views2 ;

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


-- question -1
-- Create a view named 'building_details' to display all the details of the building.
-- Input Format
-- The input tables are populated in the backend. 

-- Output Format
-- The output will have the below header if the view is created successfully.
-- id, owner_name, address, building_type_id, contact_number, email_address  

create view building_details 
as 
select * from building;

select * from  building_details;

-- question -2
-- Create a view named 'building_owners' to display all the owners of the building.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The output will have the below header if the view is created successfully.
-- owner_name

create view building_owners
as
select owner_name from building;

select * from building_owners;

-- question -3 
-- Create a view named 'owner_details' to display the owner name and contact number of the buildings having length of the owner name greater than 15.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The output will have the below header if the view is created successfully.
-- owner_name, contact_number


CREATE VIEW owner_details AS
SELECT  owner_name, contact_number
FROM building
WHERE LENGTH(owner_name) > 15;

select * from owner_details;

-- question- 4
-- Create a view named 'electricity_reading_details' to display all the details of the electricity having total units per day greater than 500 units.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The Output header will have all the columns from electricity_reading table.

create view electricity_reading_details
as
select * from electricity_reading 
where total_units >500;

select * from electricity_reading_details;


-- question -5
-- Create a view named 'all_payable_amount' to display the meter number and its corresponding payable amount in the bill.
-- Input Format
-- The input tables are populated in the backend. 
-- Output Format
-- The output will have the below header if the view is created successfully.
-- meter_number, payable_amount


CREATE VIEW all_payable_amount AS
SELECT A.meter_number, B.payable_amount
FROM 
meter A JOIN bill B ON A.id = B.meter_id;

select * from all_payable_amount ;