-- targil 2
-- 1. use join- find all employees without branch
select Employee.* from Employee 
LEFT JOIN Branch on Employee.branch_id==Branch.branch_id
where Employee.branch_id is NULL;

-- 1.5. use join- find all employees with and without branch
select Employee.*,Branch.branch_name as branch_name 
from Employee LEFT JOIN Branch on Employee.branch_id==Branch.branch_id;

-- 2. use join- find all branches without employees
select Branch.* from Branch 
LEFT JOIN Employee on Branch.branch_id= Employee.branch_id
where Employee.branch_id is NULL;

-- 2.5. use join- find all branches without and without employees
select * from Branch 
LEFT JOIN Employee on Branch.branch_id= Employee.branch_id GROUP by Branch.branch_id;

-- 3. use join- find all employees and all branches
select * from Branch 
FULL JOIN Employee on Branch.branch_id= Employee.branch_id;

-- 4. use join- show only  employees who have branches
select Employee.* from Employee 
INNER JOIN Branch 
on Employee.branch_id==Branch.branch_id;

-- 5. use join - show all employees that dont have branch and branches that dont have employees
select * from Employee 
FULL JOIN Branch 
on Employee.branch_id==Branch.branch_id
where Branch.branch_id is NULL or Employee.branch_id is NULL;

-- group by - count how many employees in each branch. show only barnches who have employees
select count(Employee.emp_id), Branch.* from Branch 
INNER JOIN Employee on Branch.branch_id= Employee.branch_id
GROUP by Branch.branch_id;

-- group by - show avg salary for each branch. show only barnches who have employees
select Branch.*,round(avg(Employee.salary),2) as avg_salary from Branch 
INNER JOIN Employee on Branch.branch_id= Employee.branch_id
GROUP by Branch.branch_id
