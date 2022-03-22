#10.	Determine the average salary FOR EACH department. USE ALL salary information AND round your results.

SELECT d.dept_name, round(AVG(s.salary)) AS ave_salary
FROM dept_emp AS de
JOIN departments AS d USING(dept_no)
JOIN salaries AS s USING(emp_no)
GROUP BY d.dept_name
ORDER BY ave_salary DESC;
#11.	Bonus Find the NAMES of ALL current employees, their department NAME, AND their current manager's name.

SELECT e.emp_no, concat(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name, concat(m.first_name, ' ', m.last_name) AS manager_name
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING (dept_no)
JOIN dept_manager AS dm USING(dept_no)
JOIN employees AS m ON m.emp_no = dm.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE curdate() < de.to_date AND curdate() < dm.to_date AND curdate() < s.to_date
ORDER BY emp_no ASC;

