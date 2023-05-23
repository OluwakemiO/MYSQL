SELECT DISTINCT EmployeeID
FROM EmployeeSalary

UPDATE EmployeeSalary
SET EmployeeID=1011
WHERE JobTitle='SALESMAN'

UPDATE EmployeeSalary
SET JobTitle='Receptionist'
where EmployeeID=1010

insert EmployeeSalary values
(1015,'HR',50000)

UPDATE EmployeeSalary
SET EmployeeID=1001 WHERE JobTitle='SALESMAN' AND SALARY=45000

SELECT *
FROM EmployeeSalary

SELECT SUM(SALARY)
FROM EmployeeSalary

SELECT COUNT(SALARY)
FROM EmployeeSalary

SELECT AVG(SALARY)
FROM EmployeeSalary

SELECT AVG(SALARY)
FROM EmployeeSalary
WHERE JobTitle='SALESMAN'