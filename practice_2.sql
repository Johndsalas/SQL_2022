
#6.	Find the number of current employees IN EACH department.

SELECT d.dept_name, count(*) AS number_of_employees
FROM dept_emp AS de
JOIN departments AS d USING(dept_no)
WHERE curdate() < de.to_date
GROUP BY d.dept_name;

#7.	Which department has the highest average salary? Hint: USE current NOT historic information.

SELECT d.dept_name, round(AVG(s.salary),0) AS average_salary
FROM dept_emp AS de
JOIN departments AS d USING(dept_no)
JOIN salaries AS s USING(emp_no)
WHERE curdate() < de.to_date AND curdate() < s.to_date
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8.	Who IS the highest paid employee IN the Marketing department?

SELECT concat(first_name,' ',last_name) AS Marketing_High_Roller
FROM (SELECT round(max(s.salary)) AS max_salary
				FROM dept_emp AS de
				JOIN departments AS d USING(dept_no)
				JOIN salaries AS s USING(emp_no)
				JOIN employees AS e USING(emp_no)
				WHERE curdate() < de.to_date AND curdate() < s.to_date AND d.dept_name = 'Marketing'
				GROUP BY d.dept_name) AS a
JOIN salaries AS s1 ON s1.salary = max_salary
JOIN employees AS e2 USING(emp_no);

#9.	Which current department manager has the highest salary?

SELECT t.emp_no, concat(e.first_name,' ', e.last_name) AS full_name, s.salary, d.dept_name
FROM titles AS t
JOIN employees AS e USING(emp_no)
JOIN salaries AS s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE title = "manager" AND t.to_date > curdate() AND s.to_date > curdate()
ORDER BY salary DESC
LIMIT 1;


