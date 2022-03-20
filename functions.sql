#8.	CREATE a NEW SQL script named limit_exercises.sql.
#9.	MySQL provides a way TO RETURN only UNIQUE results FROM our queries WITH the keyword DISTINCT. FOR example, TO find ALL the UNIQUE titles within the company, we could run the following QUERY:
#10.	SELECT DISTINCT title FROM titles;
#LIST the FIRST 10 DISTINCT LAST NAME sorted IN descending order.

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

#11.	Find ALL previous OR current employees hired IN the 90s AND born ON Christmas. Find the FIRST 5 employees hired IN the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.

SELECT *
FROM employees
WHERE (hire_date BETWEEN '1900-00-00' AND '1999-12-31')
AND birth_date LIKE '%-12-25'
ORDER BY hire_date ASC
LIMIT 5;

#12.	Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
#LIMIT AND OFFSET can be used TO CREATE multiple pages of data. What IS the relationship BETWEEN OFFSET (number of results TO skip), LIMIT (number of results per page), AND the page number?