

#1.	Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.#

# Done
USE employees;

SELECT* FROM employees;
#2.	Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY FIRST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

#3.	Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY FIRST NAME AND THEN LAST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

#4.	Find ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya', AND order your results returned BY LAST NAME AND THEN FIRST name. IN your comments, answer: What was the FIRST AND LAST NAME IN the FIRST ROW of the results? What was the FIRST AND LAST NAME of the LAST person IN the TABLE?

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

#5.	WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. Sort the results BY their employee number. Enter a COMMENT WITH the number of employees returned, the FIRST employee number AND their FIRST AND LAST NAME, AND the LAST employee number WITH their FIRST AND LAST name.

SELECT * FROM employees
WHERE last_name LIKE "E%"
ORDER BY emp_no;

#6.	WRITE a QUERY TO TO find ALL employees whose LAST NAME STARTS AND ENDS WITH 'E'. Sort the results BY their hire DATE, so that the newest employees are listed first. Enter a COMMENT WITH the number of employees returned, the NAME of the newest employee, AND the NAME of the oldest employee.

SELECT * FROM employees
WHERE last_name LIKE "E%"
ORDER BY hire_date DESC;

#7.	Find ALL employees hired IN the 90s AND born ON Christmas. Sort the results so that the oldest employee who was hired LAST IS the FIRST result. Enter a COMMENT WITH the number of employees returned, the NAME of the oldest employee who was hired LAST, AND the NAME of the youngest employee who was hired first.

SELECT * FROM employees
WHERE birth_date LIKE "%-12-25" 
AND hire_date BETWEEN "1900-00-00" AND "1999-12-31"
ORDER BY hire_date ASC;


