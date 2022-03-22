
#1.	Use the employees database.
#2.	USING the example IN the Associative TABLE Joins section AS a guide, WRITE a QUERY that shows EACH department along WITH the NAME of the current manager FOR that department.

SELECT d.dept_name, concat(e.first_name,' ', e.last_name) AS full_name
FROM titles AS t
JOIN employees AS e USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE title = "manager" AND t.to_date > curdate();

#3.	Find the NAME of ALL departments currently managed BY women.

SELECT d.dept_name, concat(e.first_name,' ', e.last_name) AS full_name
FROM titles AS t
JOIN employees AS e USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE title = "manager" AND t.to_date > curdate() AND e.gender = 'F';

#4.	Find the current titles of employees currently working IN the Customer Service department.

SELECT t.emp_no, concat(e.first_name,' ', e.last_name) AS full_name, t.title
FROM dept_emp AS de
JOIN departments AS d USING(dept_no)
JOIN titles AS t USING(emp_no)
JOIN employees AS e USING(emp_no)
WHERE dept_name = "Customer Service" AND de.to_date > curdate() AND t.to_date > curdate();

#5.	Find the current salary of ALL current managers.

SELECT t.emp_no, concat(e.first_name,' ', e.last_name) AS full_name, s.salary
FROM titles AS t
JOIN employees AS e USING(emp_no)
JOIN salaries AS s USING(emp_no)
WHERE title = "manager" AND t.to_date > curdate() AND s.to_date > curdate();

