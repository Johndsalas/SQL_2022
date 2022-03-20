

#1.	Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;

SELECT * FROM employees;
#2.	Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya' USING IN. Enter a COMMENT WITH the number of records returned.

SELECT * FROM employees 
WHERE first_name IN ('Irena', 'Vidya','Maya');

#3.	Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AS IN Q2, but USE OR instead of IN. Enter a COMMENT WITH the number of records returned. Does it MATCH number of ROWS FROM Q2?

SELECT * FROM employees
WHERE first_name = "Irena" 
OR first_name ="vidya"
OR FIRST_name = "Maya";

#4.	Find ALL current OR previous employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', USING OR, AND who IS male. Enter a COMMENT WITH the number of records returned.

SELECT * FROM employees
WHERE (first_name = "Irena" OR first_name ="Vidya" OR first_name = "Maya")
AND gender = "M";

#5.	Find ALL current OR previous employees whose LAST NAME STARTS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS WITH E.

SELECT * FROM employees 
WHERE last_name LIKE "E%";

#6.	Find ALL current OR previous employees whose LAST NAME STARTS OR ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS OR ENDS WITH E. How many employees have a LAST NAME that ENDS WITH E, but does NOT START WITH E?

SELECT * FROM employees 
WHERE last_name LIKE "E%" OR last_name LIKE "%E";

#7.	Find ALL current OR previous employees employees whose LAST NAME STARTS AND ENDS WITH 'E'. Enter a COMMENT WITH the number of employees whose LAST NAME STARTS AND ENDS WITH E. How many employees' last names end with E, regardless of whether they start with E?

SELECT * FROM employees 
WHERE last_name LIKE "E%" AND last_name LIKE "%E";

#8.	Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT * FROM employees 
WHERE last_name LIKE "E%" OR last_name LIKE "%E";
WHERE hire_date BETWEEN '1900-00-00' AND '1999-12-31';

#9.	Find ALL current OR previous employees born ON Christmas. Enter a COMMENT WITH the number of employees returned.

SELECT * FROM employees 
WHERE birth_date LIKE '%-12-25';

#10.	Find ALL current OR previous employees hired IN the 90s AND born ON Christmas. Enter a COMMENT WITH the number of employees returned.

SELECT * FROM employees 
WHERE birth_date LIKE '%-12-25' AND (hire_date BETWEEN '1900-00-00' AND '1999-12-31');

#11.	Find ALL current OR previous employees WITH a 'q' IN their LAST name. Enter a COMMENT WITH the number of records returned.

SELECT * FROM employees
WHERE last_name LIKE '%Q%' OR last_name LIKE '%q%';

#12.	Find ALL current OR previous employees WITH a 'q' IN their LAST NAME but NOT 'qu'. How many employees are FOUND?

SELECT * FROM employees
WHERE (last_name LIKE '%Q%' OR last_name LIKE '%q%')
AND (last_name NOT LIKE '%Qu%' AND last_name NOT LIKE '%qu%');








