-- 1. get all courses that have a lecturer,with their lecturer's name
select Courses.*, Lecturers.name from Courses
INNER join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id;
-- 2. get all courses with or without Lecturers
select Courses.*, Lecturers.name from Courses
left join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id;
-- 3. get all Lecturers with or without Courses
select Lecturers.*,Courses.name from Lecturers
LEFT join Courses on Courses.lecturer_id= Lecturers.lecturer_id;
-- 4. get all Courses without a Lecturer
select Courses.* from Courses
left join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id
WHERE Courses.lecturer_id is NULL;
-- 5. get all Lecturers without Courses
select Lecturers.* from Courses
RIGHT join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id
WHERE Courses.lecturer_id is NULL;

-- 6. get all courses with and without Lecturers
select Courses.* from Courses
FULL join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id;

-- 7. get all Courses WITHOUT Lecturers and Lecturers WITHOUT Courses
select Courses.*,Lecturers.* from Courses
FULL join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id
where Courses.lecturer_id is NULL;

--8. get all Lecturers with 'i' in their name
SELECT Lecturers.* FROM Lecturers 
WHERE name like '%i%';

-- 9 count all Lecturers
select count(*) as total_Lecturers from Lecturers;

-- 10. count all Courses
select count(*) as total_Courses from Courses;

-- 11.1. add COLUMN name weekly_hours to Courses table
ALTER TABLE Courses ADD COLUMN weekly_hours

-- 11.2 updates all course with the weekly_hours values: 4/6/8

UPDATE  Courses SET weekly_hours=4 WHERE course_id=1;
UPDATE  Courses SET weekly_hours=6 WHERE course_id=2;
UPDATE  Courses SET weekly_hours=8 WHERE course_id=3;
UPDATE  Courses SET weekly_hours=4 WHERE course_id=4;
UPDATE  Courses SET weekly_hours=6 WHERE course_id=5;
UPDATE  Courses SET weekly_hours=8 WHERE course_id=6;
UPDATE  Courses SET weekly_hours=4 WHERE course_id=7;
UPDATE  Courses SET weekly_hours=6 WHERE course_id=8;
UPDATE  Courses SET weekly_hours=8 WHERE course_id=9;
UPDATE  Courses SET weekly_hours=4 WHERE course_id=10;
UPDATE  Courses SET weekly_hours=6 WHERE course_id=11;
UPDATE  Courses SET weekly_hours=8 WHERE course_id=12;
UPDATE  Courses SET weekly_hours=4 WHERE course_id=13;

-- 12.get count courses for each weekly_hours
SELECT Courses.weekly_hours,count(Courses.course_id) as total_courses from Courses
GROUP by weekly_hours;

-- 13 get all Lecturers teach Courses with 8 weekly_hours
SELECT Lecturers.*,Courses.name,Courses.weekly_hours from Courses
join Lecturers on Courses.lecturer_id= Lecturers.lecturer_id
WHERE weekly_hours=8;

-- 14. delete all courses WITHOUT Lecturer and with weekly_hours is 4
delete from Courses where lecturer_id is null and weekly_hours=4;

------------------------------------------------------------------------------------

-- 15. get all Employees and their Departments details
SELECT * from Employees
join  Departments on Employees.department_id= Departments.department_id;

--16. get all Employees with and without Departments and their Departments
SELECT Employees.*,Departments.* from Employees
left join  Departments on Employees.department_id= Departments.department_id;

--17. get all Employees without Departments 
SELECT Employees.* from Employees
left join  Departments on Employees.department_id= Departments.department_id
WHERE Employees.department_id is NULL;

-- 18. count total Employees for each department
SELECT count(*) as total_employees from Employees;

-- 19. find the average salary for each department
select employee_id, avg(salary) from Employees
GROUP by Employees.employee_id;

--20. get the highest salary for each Department and the Employee's owner of this max salary
SELECT Employees.name,Employees.salary from Employees 
join (
select department_id as max_department,max(salary) as max_salary from Employees
WHERE department_id is not null GROUP by Employees.department_id )
on Employees.salary=max_salary and Employees.department_id= max_department
ORDER by department_id;

-- 21. get all Employee order by their seniority and their Department's details
SELECT Departments.*,Employees.* from Employees 
join Departments on Employees.department_id= Departments.department_id
ORDER by Employees.seniority;

-- 22. get the average salary for each seniority level
select Employees.seniority, round(avg(Employees.salary),2) as avg_salary FROM Employees
GROUP by Employees.seniority;

-- challenge:
ALTER TABLE Departments ADD COLUMN total_employees INTEGER DEFAULT 0;
ALTER TABLE Departments ADD COLUMN avg_salary INTEGER DEFAULT 0;
ALTER TABLE Departments ADD COLUMN avg_seniority INTEGER DEFAULT 0;
UPDATE Departments set total_employees =count_employees ,
avg_salary=avg_sal,
avg_seniority=avg_sen
from (
select Departments.department_id as d_id,count(Employees.employee_id) as count_employees ,avg(Employees.salary) as avg_sal,avg(seniority) as avg_sen from Departments
join Employees on Departments.department_id =Employees.department_id
GROUP by Employees.department_id
)
where Departments.department_id=d_id


