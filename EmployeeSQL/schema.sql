-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/utVdiI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Conceptual Phase
-- Logical Phase
-- Physical Phase

CREATE TABLE "Department" (
    "dept_no" VARCHAR(200)   NOT NULL,
    "dept_name" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM "Department";

CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "birth_date" VARCHAR(100)   NOT NULL,
    "first_name" VARCHAR(200)   NOT NULL,
    "last_name" VARCHAR(200)   NOT NULL,
    "gender" VARCHAR(5)   NOT NULL,
    "hire_date" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "Employee";

CREATE TABLE "DepartmentManager" (
    "dept_mng_id" SERIAL NOT NULL,
    "dept_no" VARCHAR(200)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" VARCHAR(100)   NOT NULL,
    "to_date" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_DepartmentManager" PRIMARY KEY (
        "dept_mng_id"
     )
);

SELECT * FROM "DepartmentManager";

CREATE TABLE "DepartmentEmployee" (
    "dept_emp_id" SERIAL NOT NULL,
	"emp_no" int   NOT NULL,
    "dept_no" VARCHAR(200)   NOT NULL,
    "from_date" VARCHAR(100)   NOT NULL,
    "to_date" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_DepartmentEmployee" PRIMARY KEY (
        "dept_emp_id"
     )
);

SELECT * FROM "DepartmentEmployee" LIMIT 100;

CREATE TABLE "Salary" (
    "emp_salary_id" SERIAL NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" VARCHAR(100)   NOT NULL,
    "to_date" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "emp_salary_id"
     )
);

SELECT * FROM "Salary";

CREATE TABLE "EmployeeTitle" (
    "emp_title_id" SERIAL   NOT NULL,
    "emp_no" int   NOT NULL,
    "title" VARCHAR(200)   NOT NULL,
    "from_date" VARCHAR(100)   NOT NULL,
    "to_date" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_EmployeeTitle" PRIMARY KEY (
        "emp_title_id"
     )
);

SELECT * FROM "EmployeeTitle";

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "DepartmentEmployee" ADD CONSTRAINT "fk_DepartmentEmployee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "DepartmentEmployee" ADD CONSTRAINT "fk_DepartmentEmployee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "EmployeeTitle" ADD CONSTRAINT "fk_EmployeeTitle_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

