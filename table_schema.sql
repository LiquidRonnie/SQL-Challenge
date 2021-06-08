
CREATE TABLE "Departments" (
    "DEPT_NUM" VARCHAR   NOT NULL,
    "DEPT_NAME" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DEPT_NUM"
     )
);

CREATE TABLE "Jobs" (
    "JOB_CODE" VARCHAR   NOT NULL,
    "JOB_TITLE" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Jobs" PRIMARY KEY (
        "JOB_CODE"
     )
);

CREATE TABLE "Employees" (
    "EMP_ID" INT   NOT NULL,
    "JOB_CODE" VARCHAR   NOT NULL,
    "DOB" DATE   NOT NULL,
    "FIRST_NAME" VARCHAR   NOT NULL,
    "LAST_NAME" VARCHAR   NOT NULL,
    "SEX" VARCHAR   NOT NULL,
    "HIRE_DATE" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EMP_ID"
     )
);

CREATE TABLE "Employee_Department" (
    "EMP_ID" INT   NOT NULL,
    "DEPT_NUM" VARCHAR   NOT NULL
);

CREATE TABLE "Manager_Departments" (
    "DEPT_NUM" VARCHAR   NOT NULL,
    "EMP_ID" INT   NOT NULL
);

CREATE TABLE "Salary" (
    "EMP_ID" INT   NOT NULL,
    "SALARY" INT   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_JOB_CODE" FOREIGN KEY("JOB_CODE")
REFERENCES "Jobs" ("JOB_CODE");

ALTER TABLE "Employee_Department" ADD CONSTRAINT "fk_Employee_Department_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

ALTER TABLE "Employee_Department" ADD CONSTRAINT "fk_Employee_Department_DEPT_NUM" FOREIGN KEY("DEPT_NUM")
REFERENCES "Departments" ("DEPT_NUM");

ALTER TABLE "Manager_Departments" ADD CONSTRAINT "fk_Manager_Departments_DEPT_NUM" FOREIGN KEY("DEPT_NUM")
REFERENCES "Departments" ("DEPT_NUM");

ALTER TABLE "Manager_Departments" ADD CONSTRAINT "fk_Manager_Departments_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

