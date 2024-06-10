create view view1 as
SELECT
	Description,
    AVG(Price * Quantity) AvgTotal
FROM InvoiceLineItem
GROUP BY Description;
select * from view1;

create view view2 as 
SELECT 
	c.ClientId,
    c.FirstName,
    c.LastName,
    SUM(li.Price * li.Quantity) Total
FROM Client c
INNER JOIN Invoice i ON c.ClientId = i.ClientId
INNER JOIN InvoiceLineItem li ON i.InvoiceId = li.InvoiceId
WHERE i.InvoiceStatus = 2
GROUP BY c.ClientId, c.FirstName, c.LastName
HAVING SUM(li.Price * li.Quantity) > 1000.00
ORDER BY c.LastName, c.FirstName;

select * from view2;
 
 
 USE TrackIt;

SELECT *
FROM Worker
WHERE WorkerId IN (
    SELECT WorkerId FROM ProjectWorker
);

SELECT
    g.ProjectName,
    g.MinTaskId,
    t.Title MinTaskTitle
FROM Task t
INNER JOIN (
    SELECT
        p.Name ProjectName,
        MIN(t.TaskId) MinTaskId
    FROM Project p
    INNER JOIN Task t ON p.ProjectId = t.ProjectId
    GROUP BY p.ProjectId, p.Name) g ON t.TaskId = g.MinTaskId;
    
SELECT
    w.FirstName,
    w.LastName,
    (SELECT COUNT(*) FROM ProjectWorker 
    WHERE WorkerId = w.WorkerId) ProjectCount
FROM Worker w;

SELECT
    p.Name ProjectName,
    MIN(t.TaskId) MinTaskId,
    (SELECT Title FROM Task 
    WHERE TaskId = MIN(t.TaskId)) MinTaskTitle
FROM Project p
INNER JOIN Task t ON p.ProjectId = t.ProjectId
GROUP BY p.ProjectId, p.Name;

CREATE VIEW ProjectNameWithMinTaskId
AS
SELECT
    p.Name ProjectName,
    MIN(t.TaskId) MinTaskId
FROM Project p
INNER JOIN Task t ON p.ProjectId = t.ProjectId
GROUP BY p.ProjectId, p.Name;

SELECT * FROM ProjectNameWithMinTaskId;

SELECT
    pt.ProjectName,
    pt.MinTaskId TaskId,
    t.Title
FROM Task t
INNER JOIN ProjectNameWithMinTaskId pt -- Aliased just like a table.
    ON t.TaskId = pt.MinTaskId;
    
create view view1 as
SELECT
	Description,
    AVG(Price * Quantity) AvgTotal
FROM InvoiceLineItem
GROUP BY Description;
select * from view1;

create view view2 as 
SELECT 
	c.ClientId,
    c.FirstName,
    c.LastName,
    SUM(li.Price * li.Quantity) Total
FROM Client c
INNER JOIN Invoice i ON c.ClientId = i.ClientId
INNER JOIN InvoiceLineItem li ON i.InvoiceId = li.InvoiceId
WHERE i.InvoiceStatus = 2
GROUP BY c.ClientId, c.FirstName, c.LastName
HAVING SUM(li.Price * li.Quantity) > 1000.00
ORDER BY c.LastName, c.FirstName;

select * from view2;