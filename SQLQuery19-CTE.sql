---CTE=COMMON TABLE EXPRESSION is a temporary named result set created from a 
---simple SELECT statement that can be used in a subsequent SELECT statement. 
---Each SQL CTE is like a named query, whose result is stored in a virtual table (a CTE) to be referenced later in�the�main�query. 
--- IT IS LIKE A SUB-QUERIE THAT IS STORE IN MEMORY INSTEAD OF A TEMPORARY FILE

---USING A PREVIOUS SELECT STATEMENT SHOWN BELOW:

SELECT edem.EmployeeID,Firstname,LastName,Gender,Salary
, COUNT(Gender) OVER (PARTITION BY GENDER) AS TotalGender
, AVG(Salary) OVER (PARTITION BY GENDER) AS Avgsalary
FROM EmployeeDemographics AS EDem
JOIN EmployeeSalary AS ESal
ON EDem.EmployeeID=ESal.EmployeeID
WHERE Salary>45000

---THE ABOVE SELECT STATEMENT IS AN AGREGATE FUNCTION. AN AGREGATE FUNCTION PERFORMS A CALCULATION ON A SET VALUES, AND RETURNS A SINGLE VALUE.
---EXCEPT FOR 'COUNT', AGGREGATE FUNCTIONS IGNORE NULL VALUES. THEY ARE OFTEN USED WITH THE 'GROUP BY' CLAUSE OF THE 'SELECT' STATEMENT.
---THE FOLLOWING ARE SQL Aggregate functions:
---APPROX_COUNT_DISTINCT
---AVG
---CHECKSUM_AGG
---COUNT
---COUNT_BIG
---GROUPING
---GROUPING_ID
---MAX
---MIN
---STDEV
---STDEVP
---STRING_AGG
---SUM
---VAR
---VARP

---WE CAN QUERIE THE SELECT STATEMENT OVER AND OVER USING THE CTE AS SHOWN BELOW:

WITH CTE_Employee AS 
(SELECT FirstName,LastName,Gender,Salary
, COUNT(Gender) OVER (PARTITION BY GENDER) AS TotalGender
, AVG(Salary) OVER (PARTITION BY GENDER) AS Avgsalary
FROM EmployeeDemographics AS EDem
JOIN EmployeeSalary AS ESal
ON EDem.EmployeeID=ESal.EmployeeID
WHERE Salary>45000
)
SELECT*
FROM CTE_Employee

---IF WE TRY TO RUN THIS STATEMENT ALONE:
SELECT*
FROM CTE_Employee

---IT WILL NOT WORK, WE HAVE TO QUERIE THE WHOLE STATEMENT AGAIN. THIS IS BECAUSE THE CTE IS NOT STORE ANYWHERE AND IS CREATED OVER AGAIN EACH TIME
---WE RUN THE ENTIRE QUERIE. WE CAN ALSO REPLACE THE SELECT * WITH SPECIFIC COLUMNS IE

WITH CTE_Employee AS 
(SELECT FirstName,LastName,Gender,Salary
, COUNT(Gender) OVER (PARTITION BY GENDER) AS TotalGender
, AVG(Salary) OVER (PARTITION BY GENDER) AS Avgsalary
FROM EmployeeDemographics AS EDem
JOIN EmployeeSalary AS ESal
ON EDem.EmployeeID=ESal.EmployeeID
WHERE Salary>45000
)
SELECT FirstName,AvgSalary
FROM CTE_Employee

---ABOVE QUERIE WILL RETURN ONLY THE FIRST NAMES AND THE AVERAGE SALARY. IN THE ABOVE EXAMPLES, 
---WE WERE ABLE TO USE THE CTE WITH AN AGGREGATE FUNCTION BUT WE CAN CREATE SIMPLER CTE's THAN THIS

---


SELECT*
FROM EmployeeDemographics

SELECT*
FROM EmployeeSalary

SELECT Edem.EmployeeID,FirstName,LastName,jobtitle,Gender,Salary
FROM EmployeeDemographics AS EDem
JOIN EmployeeSalary AS ESal
ON EDem.EmployeeID=ESal.EmployeeID