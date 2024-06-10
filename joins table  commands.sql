SELECT * FROM trackit.taskstatus;
SELECT *
FROM TaskStatus
WHERE IsResolved = 1;

SELECT 
  Task.TaskId,
  Task.Title,
  TaskStatus.Name
FROM TaskStatus
INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;

select 
t.TaskId ,
t.DueDate,
ts.Name,
ts.IsResolved
from taskstatus ts
inner join task t on t.TaskStatusId=ts.TaskStatusId
where ts.IsResolved=1;


SELECT 
  TaskId,
  Title,
  `Name`
FROM TaskStatus
INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;


SELECT 
  TaskId,
  Title,
  Name
FROM TaskStatus
INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;

SELECT
  Project.Name,
  Worker.FirstName,
  Worker.LastName
FROM Project
inner JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
inner JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
WHERE Project.ProjectId = 'game-goodboy';

select 
p.ProjectId,
p.Name,
pw.ProjectId,
pw.WorkerId,
w.WorkerId
from project p
inner join projectworker pw on p.ProjectId=pw.ProjectId
inner join worker w on pw.WorkerId=w.WorkerId
where p.ProjectId like 'g%';

SELECT
  Project.Name,
  Worker.FirstName,
  Worker.LastName,
  Task.Title
FROM Project
INNER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
INNER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
INNER JOIN Task ON ProjectWorker.ProjectId = Task.ProjectId
  AND ProjectWorker.WorkerId = Task.WorkerId 
WHERE Project.ProjectId = 'game-goodboy';


SELECT *
FROM Task
LEFT OUTER JOIN TaskStatus 
  ON Task.TaskStatusId = TaskStatus.TaskStatusId;
  
  SELECT
  Task.TaskId,
  Task.Title,
  IFNULL(Task.TaskStatusId, 0) AS TaskStatusId,
  IFNULL(TaskStatus.Name, '[None]') AS StatusName
FROM Task
LEFT OUTER JOIN TaskStatus 
  ON Task.TaskStatusId = TaskStatus.TaskStatusId;
  
  
  select 
  t.TaskId as task,
  t.Title,
  ifnull(t.TaskStatusId,0) as  TaskStatusId,
  ifnull(ts.name,'[none]') AS statusname
  from Task t
  Left join TaskStatus ts on t.TaskStatusId=ts.TaskStatusId;
  
  

SELECT
  Project.Name ProjectName, -- An alias makes this more clear.
  Worker.FirstName,
  Worker.LastName
FROM Project
left JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
left JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId;

SELECT
  Project.Name ProjectName
FROM Project
LEFT OUTER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
WHERE ProjectWorker.WorkerId IS NULL;


SELECT
  Project.Name ProjectName,
  Worker.FirstName,
  Worker.LastName
FROM Project
left JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
left JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
WHERE ProjectWorker.WorkerId IS NULL; 

SELECT
  Project.Name ProjectName,
  Worker.FirstName,
  Worker.LastName
FROM Project
RIGHT OUTER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
RIGHT OUTER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
WHERE ProjectWorker.ProjectId IS NULL;

SELECT
  parent.TaskId ParentTaskId,
  child.TaskId ChildTaskId,
  CONCAT(parent.Title, ': ', child.Title) Title
FROM Task parent
INNER JOIN Task child ON parent.TaskId = child.ParentTaskId;

SELECT
  p.Name ProjectName,
  w.FirstName,
  w.LastName,
  t.Title
FROM Project p
INNER JOIN ProjectWorker pw ON p.ProjectId = pw.ProjectId
INNER JOIN Worker w ON pw.WorkerId = w.WorkerId
INNER JOIN Task t ON pw.ProjectId = t.ProjectId
  AND pw.WorkerId = t.WorkerId
WHERE p.ProjectId = 'game-goodboy';

SELECT
 CONCAT(w.FirstName, ' ', w.LastName) WorkerName,
 p.Name ProjectName
FROM Worker w
CROSS JOIN Project p
WHERE w.WorkerId = 1
AND p.ProjectId NOT LIKE 'game-%';

