USE PersonalTrainer;


SELECT *
FROM ExerciseCategory c
INNER JOIN Exercise e 
	ON c.ExerciseCategoryId = e.ExerciseCategoryId;
    
    

SELECT
	c.`Name`,
    e.`Name`
FROM ExerciseCategory c
INNER JOIN Exercise e
	ON c.ExerciseCategoryId = e.ExerciseCategoryId
WHERE c.ParentCategoryId IS NULL;


SELECT
	c.`Name` CategoryName,
    e.`Name` ExerciseName
FROM ExerciseCategory c
INNER JOIN Exercise e
	ON c.ExerciseCategoryId = e.ExerciseCategoryId
WHERE c.ParentCategoryId IS NULL;


SELECT
	c.FirstName,
    c.LastName,
    c.BirthDate,
    l.EmailAddress
FROM Client c
INNER JOIN Login l
	ON c.ClientId = l.ClientId
WHERE c.BirthDate BETWEEN '1990-01-01' AND '1999-12-31';



SELECT
	c.FirstName,
    c.LastName,
    w.`Name` WorkoutName
FROM Client c
INNER JOIN ClientWorkout cw ON c.ClientId = cw.ClientId
INNER JOIN Workout w ON cw.WorkoutId = w.WorkoutId
WHERE c.LastName LIKE 'C%';


SELECT
	w.`Name` WorkoutName,
	g.`Name` GoalName
FROM Workout w
INNER JOIN WorkoutGoal wg ON w.WorkoutId = wg.WorkoutId
INNER JOIN Goal g ON wg.GoalId = g.GoalId;



SELECT
	c.FirstName,
    c.LastName,
    l.ClientId,
    l.EmailAddress
FROM Client c
LEFT OUTER JOIN Login l ON c.ClientId = l.ClientId;


SELECT
	c.FirstName,
    c.LastName,
    l.ClientId,
    l.EmailAddress
FROM Client c
LEFT OUTER JOIN Login l ON c.ClientId = l.ClientId
WHERE l.ClientId IS NULL;



SELECT
	c.FirstName,
    c.LastName,
    l.ClientId,
    l.EmailAddress
FROM Client c
LEFT OUTER JOIN Login l ON c.ClientId = l.ClientId
WHERE c.FirstName = 'Romeo'
AND c.LastName = 'Seaward';


SELECT
	p.`Name` ParentCategory,
    ec.`Name` Category
FROM ExerciseCategory ec
INNER JOIN ExerciseCategory p 
	ON ec.ParentCategoryId = p.ExerciseCategoryId;

SELECT
	p.`Name` ParentCategory,
    ec.`Name` Category
FROM ExerciseCategory ec
LEFT OUTER JOIN ExerciseCategory p 
	ON ec.ParentCategoryId = p.ExerciseCategoryId;

SELECT
	c.FirstName,
    c.LastName
FROM Client c
LEFT OUTER JOIN ClientWorkout cw ON c.ClientId = cw.ClientId
WHERE cw.WorkoutId IS NULL;


SELECT
	w.WorkoutId,
	w.`Name` WorkoutName
FROM Client c
INNER JOIN ClientGoal cg ON c.ClientId = cg.ClientId
INNER JOIN WorkoutGoal wg ON cg.GoalId = wg.GoalId
INNER JOIN Workout w ON wg.WorkoutId = w.WorkoutId
WHERE c.FirstName = 'Shell'
AND c.LastName = 'Creane'
AND w.LevelId = 1;



SELECT
	w.`Name` WorkoutName,
    g.`Name` GoalName
FROM Workout w
LEFT OUTER JOIN WorkoutGoal wg 
	ON w.WorkoutId = wg.WorkoutId AND wg.GoalId = 10
LEFT OUTER JOIN Goal g ON wg.GoalId = g.GoalId;



SELECT
	w.`Name` WorkoutName,
    e.`Name` ExerciseName
FROM Workout w
INNER JOIN WorkoutDay wd 
	ON w.WorkoutId = wd.WorkoutId
INNER JOIN WorkoutDayExerciseInstance wdei 
	ON wd.WorkoutDayId = wdei.WorkoutDayId
INNER JOIN ExerciseInstance ei 
	ON wdei.ExerciseInstanceId = ei.ExerciseInstanceId
INNER JOIN Exercise e 
	ON ei.ExerciseId = e.ExerciseId;
   

SELECT
	e.`Name` ExerciseName,
    uv.`Value`,
    u.`Name` UnitName
FROM Exercise e
INNER JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
LEFT OUTER JOIN ExerciseInstanceUnitValue uv
	ON ei.ExerciseInstanceId = uv.ExerciseInstanceId
LEFT OUTER JOIN Unit u On uv.UnitId = u.UnitId
WHERE e.`Name` = 'Plank';