#12.	Bonus Who is the highest paid employee within each department.

SELECT dept_name, concat(first_name, ' ', last_name) AS full_name, salary
FROM (SELECT d.dept_name, max(s.salary) AS max_salary
		FROM departments AS d
		JOIN dept_emp AS de USING(dept_no)
		JOIN employees AS e USING(emp_no)
		JOIN salaries AS s USING(emp_no)
		WHERE curtime() < s.to_date AND curtime() < de.to_date
		GROUP BY dept_name) AS a
JOIN salaries AS s1 ON s1.salary = max_salary
JOIN employees AS e1 USING(emp_no);

#13.	Find ALL the current employees WITH the same hire DATE AS employee 101010 USING a sub-query.

SELECT concat(e1.first_name, ' ', e1.last_name) AS full_name, e1.hire_date
FROM (SELECT *
		FROM employees
		WHERE emp_no = 101010) AS a
JOIN employees AS e1 USING(hire_date);
#14.	Find ALL the titles ever held BY ALL current employees WITH the FIRST NAME Aamod.

SELECT t.title
FROM  (SELECT * 
		FROM employees 
		JOIN salaries AS s USING(emp_no)
		WHERE first_name = 'Armond' AND s.to_date > curdate()) AS a
JOIN titles AS t USING(emp_no)
GROUP BY title;

#15.	How many people IN the employees TABLE are NO longer working FOR the company? Give the answer IN a COMMENT IN your code.

SELECT count(*) AS ex_employees
FROM (
		SELECT e.emp_no, max(s.to_date) AS leave_date
		FROM employees AS e
		JOIN salaries AS s USING (emp_no)
		GROUP BY emp_no
		HAVING max(s.to_date) = '9999-01-01') AS a;

#16.	Find ALL the current department managers that are female. LIST their NAMES IN a COMMENT IN your code.

SELECT t.emp_no, concat(e.first_name,' ', e.last_name) AS full_name, s.salary, d.dept_name, e.gender
FROM titles AS t
JOIN employees AS e USING(emp_no)
JOIN salaries AS s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE title = "manager" AND t.to_date > curdate() AND s.to_date > curdate() AND e.gender ='F';
#17.	Find ALL the employees who currently have a higher salary THAN the companies overall, historical average salary.

SELECT concat(e.first_name,' ', e.last_name) AS full_name, max(s.salary) AS salary
FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no WHERE to_date != '9999_01_01'
GROUP BY full_name
HAVING salary > (SELECT sum(s.salary)/count(*) AS historic_average
					FROM employees AS e
					JOIN salaries AS s USING(emp_no));

SELECT sum(s.salary)/count(*) AS historic_average
FROM employees AS e
JOIN salaries AS s USING(emp_no);