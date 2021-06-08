-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	DISTINCT EMP."EMP_ID",
	EMP."FIRST_NAME",
	EMP."LAST_NAME",
	EMP."SEX",
	SAL."SALARY"
FROM
	"Employees"			EMP
INNER JOIN
	"Salary"			SAL				ON EMP."EMP_ID" = SAL."EMP_ID"
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	DISTINCT "EMP_ID", 
	"FIRST_NAME", 
	"LAST_NAME", 
	"HIRE_DATE"
FROM
	"Employees"
WHERE
	"HIRE_DATE" BETWEEN '01-01-1986' AND '12-31-1986' 
ORDER BY "EMP_ID" ASC
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	DISTINCT MAND."EMP_ID" 		AS "MANAGER_ID",
	EMP."FIRST_NAME",
	EMP."LAST_NAME",
	DEPT.*
FROM
	"Manager_Departments" 	MAND
LEFT JOIN
	"Departments"			DEPT		ON MAND."DEPT_NUM" = DEPT."DEPT_NUM"
LEFT JOIN
	"Employees"				EMP			ON MAND."EMP_ID" = EMP."EMP_ID"
ORDER BY "MANAGER_ID" ASC
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	DISTINCT EMP."EMP_ID",
	EMP."LAST_NAME",
	EMP."FIRST_NAME",
	DEPT.*
FROM
	"Employees"				EMP
LEFT JOIN
	"Employee_Department"	EMPD		ON EMP."EMP_ID" = EMPD."EMP_ID"
LEFT JOIN
	"Departments"			DEPT		ON EMPD."DEPT_NUM" = DEPT."DEPT_NUM"
ORDER BY "EMP_ID" ASC
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	"FIRST_NAME",
	"LAST_NAME",
	"SEX"
FROM
	"Employees"
WHERE 
	1=1
	AND "FIRST_NAME" = 'Hercules'
	AND "LAST_NAME" ILIKE 'B%'
ORDER BY "LAST_NAME" ASC
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

WITH EMP_DEPT_DETAILS AS 
	(
		SELECT
			DISTINCT EMP."EMP_ID",
			EMP."LAST_NAME",
			EMP."FIRST_NAME",
			EMPD."DEPT_NUM"
		FROM
			"Employees"				EMP
		INNER JOIN
			"Employee_Department"	EMPD			ON EMP."EMP_ID" = EMPD."EMP_ID"
	)
SELECT
	DTLS.*,
	DEPT."DEPT_NAME"
FROM
	"Departments"					DEPT
INNER JOIN
	EMP_DEPT_DETAILS				DTLS		ON DEPT."DEPT_NUM" = DTLS."DEPT_NUM"
WHERE
	DEPT."DEPT_NAME" = 'Sales'
ORDER BY "EMP_ID" ASC
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

WITH EMP_DEPT_DETAILS AS 
	(
		SELECT
			DISTINCT EMP."EMP_ID",
			EMP."LAST_NAME",
			EMP."FIRST_NAME",
			EMPD."DEPT_NUM"
		FROM
			"Employees"				EMP
		INNER JOIN
			"Employee_Department"	EMPD			ON EMP."EMP_ID" = EMPD."EMP_ID"
	)
SELECT
	DTLS.*,
	DEPT."DEPT_NAME"
FROM
	"Departments"					DEPT
INNER JOIN
	EMP_DEPT_DETAILS				DTLS		ON DEPT."DEPT_NUM" = DTLS."DEPT_NUM"
WHERE
	1=1
	AND (DEPT."DEPT_NAME" = 'Sales' OR DEPT."DEPT_NAME" = 'Development')
ORDER BY "EMP_ID" ASC
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	"LAST_NAME",
	COUNT("LAST_NAME")	AS	LAST_NAME_COUNT
FROM
	"Employees"
GROUP BY
	"LAST_NAME"
ORDER BY LAST_NAME_COUNT DESC
;


