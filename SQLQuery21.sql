--/Temp tables and their uses/

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(50),
Salary int
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES
('1001','HR','45000')

INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary

CREATE TABLE #temp_Employee2
(JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

SELECT *
FROM #temp_Employee2

INSERT INTO #temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age),AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
GROUP BY JobTitle