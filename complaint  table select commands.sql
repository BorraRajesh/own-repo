SELECT * FROM consumercomplaints.complaint;
SELECT * FROM consumercomplaints.complaint;
USE ConsumerComplaints;
SELECT ComplaintId, Product, Issue , Company , ResponseToConsumer FROM complaint ;
SELECT DateReceived, Product, Company, State  FROM Complaint limit 5;
select ComplaintId from complaint where ComplaintId like '%12%';
SELECT DateReceived, Product, Company, State FROM Complaint where State = 'LA' ;
SELECT DateReceived, Product, Company, State FROM Complaint where State != 'LA' ;
SELECT  Product, State FROM Complaint where State = 'LA' AND Product = 'Mortgage' ;
SELECT  Product, State FROM Complaint where State = 'LA' OR Product = 'Mortgage' ;
SELECT  Product, State FROM Complaint where State NOT IN ('LA', 'AZ', 'TX') ;
select state from complaint where state not in ('al');
SELECT  Product, State FROM Complaint where State IN ('LA', 'AZ', 'TX') ;

SELECT 
  DateReceived, 
  Product, 
  Issue, 
  Company
FROM Complaint
WHERE State = 'LA' limit 5;

SELECT *
FROM Complaint
WHERE State = 'LA'
AND (Product = 'Mortgage' OR Product = 'Debt collection');

SELECT *
FROM Complaint
WHERE State = 'LA'
AND Product = 'Mortgage' OR Product = 'Debt collection';

SELECT *  FROM Complaint where ComplaintId = 1653822;
SELECT *  FROM Complaint where ComplaintId != 1653822;
SELECT *  FROM Complaint where 	ComplaintId > 10000;
SELECT *  FROM Complaint where 	ComplaintId >= 10000;
SELECT *  FROM Complaint where 	ComplaintId < 10000;
SELECT *  FROM Complaint where 	ComplaintId <= 10000;
SELECT *  FROM Complaint where ComplaintId BETWEEN 1000 AND 30000 ;
SELECT *  FROM Complaint where ComplaintId = 1200385 ; #exist


SELECT 
  Product, 
  Issue, 
  Company, 
  ResponseToConsumer
FROM Complaint
WHERE ConsumerDisputed = 1
AND ConsumerConsent = 1
AND Product NOT IN ('Mortgage', 'Debt collection');

SELECT * FROM Complaint  where Issue  LIKE 'D%';
SELECT * FROM Complaint  where Issue LIKE '%LA%';

SELECT *
FROM Complaint
WHERE SubProduct = NULL;

-- But neither does this!
SELECT * 
FROM Complaint 
WHERE SubProduct != NULL;

-- Doesn’t complain, but doesn’t find anything. 
SELECT * 
FROM Complaint 
WHERE ComplaintId BETWEEN 15000 AND NULL; 

-- Nope. 
SELECT * 
FROM Complaint 
WHERE SubIssue IN ('Account status', NULL);