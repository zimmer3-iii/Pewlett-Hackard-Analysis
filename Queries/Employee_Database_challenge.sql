-- Create retirement_titles
SELECT emp.emp_no, 
emp.first_name,
emp.last_name,
til.title,
til.from_date,
til.to_date

INTO retirement_titles
FROM employees AS emp
INNER JOIN titles AS til
ON emp.emp_no = til.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC
;

-- Use Dictinct with Orderby to remove duplicate rows
-- Create retirement_unique
SELECT DISTINCT ON(emp_no)emp_no, 
first_name,
last_name,
title

INTO retirement_unique
FROM retirement_titles
WHERE to_date ='9999-01-01'
ORDER BY emp_no,emp_no ASC
;

--Create retiring_titles count
SELECT COUNT (title),
title
INTO  retiring_titles
FROM retirement_unique
GROUP BY title
;


-- Create mentorship_eligibility
SELECT DISTINCT ON (emp.emp_no)emp.emp_no, 
emp.first_name,
emp.last_name,
emp.birth_date,
dep.from_date,
dep.to_date,
til.title

INTO mentorship_eligibility
FROM employees AS emp
INNER JOIN dept_emp AS dep
ON emp.emp_no = dep.emp_no
INNER JOIN titles AS til
ON emp.emp_no = til.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no ASC
;


