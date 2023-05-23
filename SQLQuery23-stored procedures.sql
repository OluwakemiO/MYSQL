---STORED PROCEDURES
---A STORED PROCEDURE IS A GROUP OF STATEMENTS THAT HAVE BEEN CREATED AND STORED IN A DATABASE THAT CAN BE USED OVER AND OVER BY DIFFERENT USERS

CREATE PROCEDURE Test
AS
SELECT*
FROM EmployeeDemographics
---HOW TO USE: WHAT WE PUT IN THE STORED PROCEDURE IS THE SELECT STATEMENT WHICH MEANS THAT WHEN WE
---EXECUTE THE PROCEDURE WE WILL GET A TABLE SHOWING 
---EVERYTHING IN THE EMPLOYEEDEMOGRAPHICS TABLE AS STORED IN THE SELECT STATEMENT.

EXEC Test
---ANOTHER USE: USING STORED PROCEDURE TO CREATE A TEMPORARY TABLE AND TO INSERT VALUES INTO THE TABLE.


CREATE PROCEDURE Temp_Employee3
AS
CREATE TABLE #temp_employee3
(JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_Employee3
SELECT JobTitle, COUNT(JobTitle), AVG(Age),AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
GROUP BY JobTitle

---IF WE RUN THE PROCEDURE AS ABOVE, NOTHING WILL BE RETURNED. SO WE NEED TO ADD A SELECT STATEMENT.

SELECT *
FROM #temp_employee3

---NOW LET'S EXECUTE THE PROCEDURE
EXEC Temp_Employee3

---MODIFYING STORED PROCEDURES
SET ANSI_NULLS ON
GO
---TALKS ABOUT HOW TO USE NULLS
SET QUOTED_IDENTIFIER ON
GO
---TALKS ABOUT HOW TO USE QUOTES

---ALTER PROCEDURE
---WE'VE CREATED OUR PROCEDURE BUT NOW NEED TO ALTER IT.

ALTER PROCEDURE [dbo].[Temp_Employee]
AS
CREATE TABLE #temp_eployee
(JobTitle varchar(100),
EmployeePerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_eployee
SELECT Jobtitle, COUNT (JobTitle),AVG (Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_eployee

EXEC TEMP_EMPLOYEE

---LETS ADD A PARAMETER WHERE WE WILL SPECIFY AN INPUT THAT WILL GIVE US A SPECIFIC RESULT

ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle nvarchar(100)
AS
CREATE TABLE #temp_employee
(JobTitle varchar(100),
EmployeePerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_employee
SELECT Jobtitle, COUNT (JobTitle),AVG (Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
WHERE JobTitle=@JobTitle
GROUP BY JobTitle

SELECT *
FROM #temp_employee3

---WHEN WE RUN IT THE ABOVE,AND THEN TRY TO EXECUTE IT USING OUR EXEC COMMAND BELOW, IT WILL GIVE US AN ERROR.
---THIS IS BECAUSE IT EXPECTS US TO INCLUDE THE PARAMETER FOR @JOBTITLE


EXEC Temp_Employee

EXEC Temp_Employee3 @JobTitle='Accountant'

---SO IF WE ADD @JOBTITLE = SALESMAN AND EXECUTE IT, IT RETURNS A RESULT

EXEC temp_Employee @JobTitle='Salesman'

---NOTE: WE CAN ADD THE @JOBTITLE PARAMETER ANYWHERE IN THE INSERT COMMAND