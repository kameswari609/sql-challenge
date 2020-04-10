--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
FROM employees as  e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no
order by e.first_name;


--List employees who were hired in 1986


--where CONVERT(VARCHAR, hire_date , 120) LIKE '1986%';
--where convert(nvarchar(50), hire_date,126) LIKE '1986%';

select emp_no,first_name,last_name
from employees
WHERE CONVERT(VARCHAR(25),hire_date,126) LIKE '1986%' ;



--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

(select  m.dept_no,
d.dept_name,
m.emp_no as manger_emp_number,
m.from_date as startdate,
m.to_date as enddate,e.first_name,e.last_name
from dept_manager as m
INNER JOIN departments as d ON
m.dept_no = d.dept_no
INNER JOIN employees as e ON
m.emp_no = e.emp_no 
);



--List the department of each employee with the following information: employee number, last name, first name, and department name.
select
e.emp_no, e.last_name,e.first_name,d.dept_name
from dept_emp 
INNER JOIN employees as e ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments as d ON
dept_emp.dept_no = d.dept_no
order by d.dept_name;



--List all employees whose first name is "Hercules" and last names begin with "B."


select *
from employees 
where first_name = 'Hercules' and last_name like 'B.%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.


select d.dept_name,
e.emp_no,e.first_name,e.last_name
from dept_emp 
INNER JOIN employees as e ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments as d ON
dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select d.dept_name,
e.emp_no,e.first_name,e.last_name
from dept_emp 
INNER JOIN employees as e ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments as d ON
dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales' and d.dept_name = 'devolopment'
order by d.dept_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select count(last_name) as  "no of emp" , last_name
from employees
group by last_name
order by count(last_name) desc;
