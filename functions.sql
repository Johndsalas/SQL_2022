#1.	Copy the order by exercise and save it as functions_exercises.sql.
#2.	WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. USE concat() TO combine their FIRST AND LAST NAME together AS a single COLUMN named full_name.

SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%e';
#3.	CONVERT the NAMES produced IN your LAST QUERY TO ALL uppercase.

SELECT concat(upper(first_name), ' ', upper(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%e';

#4.	Find ALL employees hired IN the 90s AND born ON Christmas. USE datediff() FUNCTION TO find how many days they have been working AT the company (Hint: You will also need TO USE NOW() OR CURDATE()),

SELECT concat(upper(first_name), ' ', upper(last_name)) AS full_name, 
		  birth_date, hire_date, 
       now() AS today, 
       datediff(DAY, now(), hire_date) AS tenure 
FROM employees
WHERE hire_date BETWEEN '1900-00-00' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
#5.	Find the smallest AND largest current salary FROM the salaries table.

SELECT * FROM salaries;

SELECT max(salary) AS max_salary, min(salary) AS min_salary
FROM salaries;
#6.	USE your knowledge of built IN SQL functions TO generate a username FOR ALL of the employees. A username should be ALL lowercase, AND consist of the FIRST CHARACTER of the employees FIRST NAME, the FIRST 4 characters of the employees LAST NAME, an underscore, the MONTH the employee was born, AND the LAST two digits of the YEAR that they were born. Below IS an example of what the FIRST 10 ROWS will look LIKE:

SELECT *, 
concat(lower(substring(first_name,1,1)),lower(substring(last_name,1,4)),'-',substring(birth_date,6,2),substring(birth_date,3,2)) AS user_name
FROM employees;