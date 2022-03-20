#1.	Create a new file named group_by_exercises.sql
#2.	IN your script, USE DISTINCT TO find the UNIQUE titles IN the titles table. How many UNIQUE titles have there ever been? Answer that IN a COMMENT IN your SQL file.

SELECT DISTINCT title
FROM titles;
#3.	WRITE a QUERY TO TO find a LIST of ALL UNIQUE LAST NAMES of ALL employees that START AND END WITH 'E' USING GROUP BY.

SELECT last_name 
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY LAST_NAME;
#4.	WRITE a QUERY TO TO find ALL UNIQUE combinations of FIRST AND LAST NAMES of ALL employees whose LAST NAMES START AND END WITH 'E'.

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY LAST_NAME, first_name;
#5.	WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code.

SELECT last_name 
FROM employees
WHERE (last_name LIKE 'Q%' OR last_name LIKE '%q%')
AND (last_name NOT LIKE 'Qu%' AND last_name NOT LIKE '%qu%')
GROUP BY last_name;

#6.	ADD a COUNT() TO your results (the QUERY above) TO find the number of employees WITH the same LAST name.

SELECT last_name, count(*) count_of_name
FROM employees
WHERE (last_name LIKE 'Q%' OR last_name LIKE '%q%')
AND (last_name NOT LIKE 'Qu%' AND last_name NOT LIKE '%qu%')
GROUP BY last_name;

#7.	Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names.

SELECT gender, count(gender)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

#8.	USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?

SELECT *, 
concat(lower(substring(first_name,1,1)),lower(substring(last_name,1,4)),'-',substring(birth_date,6,2),substring(birth_date,3,2)) AS user_name
FROM employees;

#9.	More practice WITH AGGREGATE functions:
#•	Determine the historic average salary FOR EACH employee. WHEN you hear, READ, OR think "FOR EACH" WITH regard TO SQL, you'll probably be grouping BY that exact column.

USE employees;

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;
#•	Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.

SELECT dept_no, count(emp_no)
FROM dept_emp
GROUP BY dept_no;

#•	Determine how many different salaries EACH employee has had. This includes BOTH historic AND current.

SELECT emp_no, count(salary)
FROM salaries
GROUP BY emp_no;
#•	Find the maximum salary FOR EACH employee.

SELECT emp_no, max(salary)
FROM salaries
GROUP BY emp_no;
#•	Find the minimum salary FOR EACH employee.

SELECT emp_no, min(salary)
FROM salaries
GROUP BY emp_no;
#•	Find the standard deviation of salaries FOR EACH employee.

SELECT emp_no, round(std(salary),0)
FROM salaries
GROUP BY emp_no;

#•	Now find the max salary FOR EACH employee WHERE that max salary IS greater THAN $150,000.

SELECT emp_no, max(salary)
FROM salaries
WHERE salary > 150000
GROUP BY emp_no;

#•	Find the average salary FOR EACH employee WHERE that average salary IS BETWEEN $80k AND $90k.

SELECT emp_no, max(salary)
FROM salaries
WHERE salary BETWEEN 80000 AND 90000
GROUP BY emp_no;




