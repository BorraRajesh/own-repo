SELECT * FROM personaltrainer.exercise;
use personaltrainer;
SELECT * FROM personaltrainer.client;
select * from client where city ='Metairie';
select * from client where ClientId = '818u7faf-7b4b-48a2-bf12-7a26c92de20c';
select * from goal ;
select name , LevelId from workout;
select name , LevelId,Notes from workout where LevelId = 2;
SELECT FirstName, LastName, City
FROM Client
WHERE City IN ('Metairie', 'Kenner', 'Gretna');
--
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate LIKE '198%';

select * from login where EmailAddress LIKE '%.gov';
select * from login where EmailAddress NOT LIKE '%.com';
Select FirstName , LastName 
from client
where BirthDate is NULL;

select  Name from exercisecategory where ParentCategoryId is NOT NULL;
SELECT Name, Notes
FROM Workout
WHERE LevelId = 3 AND Notes LIKE '%you%';

Select FirstName, LastName, City from Client where (LastName like 'L%' or  LastName Like 'M%'  or LastName Like ' N%') and city = 'LaPlace';

SELECT InvoiceId, Description, Price, Quantity, ServiceDate, 
       (Price * Quantity) AS LineItemTotal
FROM InvoiceLineItem
WHERE (Price * Quantity) BETWEEN 15 AND 25;

SELECT ClientId, FirstName, LastName
FROM Client
WHERE FirstName = 'Estrella' AND LastName = 'Bazely';
SELECT * FROM personaltrainer.Client WHERE FirstName = 'Estrella' AND LastName = 'Bazely';
SELECT * FROM personaltrainer.Login  WHERE ClientId = (SELECT ClientId FROM Client WHERE FirstName = 'Estrella' AND LastName = 'Bazely');

select WorkoutId from workout where Name= 'This is Parkour';
SELECT Name FROM personaltrainer.Goal 
WHERE GoalId IN (
SELECT GoalId FROM WorkoutGoal 
WHERE WorkoutId = (SELECT WorkoutId FROM Workout WHERE Name = 'This Is Parkour')
);

create view work as select * from personaltrainer.goal;
select * from work;