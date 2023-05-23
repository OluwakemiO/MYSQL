---CASE STATEMENT
---CASE STATEMENT COMES AFTER THE SELECT STATEMENT. IT ALLOWS YOU TO SPECIFY 
---CONDITIONS AND ALSO WHAT YOU WANT RETURNED WHEN THE CONDITION IS MET

SELECT*
FROM EmployeeDemographics
WHERE AGE IS NOT NULL
ORDER BY AGE

--ADDING CASE STATEMENT TO FULLFULL A CONDITION
--WE NEED FIRSTNAME,LASTNAME AND AGE DO WE'LL SPECIFY THOSE IN OR SELECT STMT BEFORE OUR CASE STMNT

SELECT FirstName,LastName,Age,
CASE
     WHEN AGE>30 THEN 'Old'
     ELSE 'Young'
END
FROM EmployeeDemographics
WHERE AGE IS NOT NULL
ORDER BY Age

--OR WE CAN DO MORE WHEN STATEMENTS--

SELECT FirstName,LastName,Age,
CASE
     WHEN AGE>30 THEN 'Old'
	 WHEN AGE BETWEEN 27 AND 30 THEN 'Young'
     ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE AGE IS NOT NULL
ORDER BY Age

---In both scripts, a new column is created. We can rename the new column if we want. i.e

SELECT FirstName,LastName,Age,
CASE
     WHEN AGE>30 THEN 'Old'
	 WHEN AGE BETWEEN 27 AND 30 THEN 'Young'
     ELSE 'Baby'
END as AgeSatus
FROM EmployeeDemographics
WHERE AGE IS NOT NULL
ORDER BY Age

---Above script renames the new column as 'AgeStatus'
---Another use case is using the CASE statmt to do some calculations.
---EXAMPLE:

SELECT*
FROM EmployeeDemographics
Join EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

---We want to use the case statement to calculate the bonus for Employees with Jobtitles SALESMAN, ACCOUNTANT AND HR
---We will need the FirstName,LastName,Jobtitle and Salary of the Employees.

SELECT FirstName,LastName,JobTitle,Salary
FROM EmployeeDemographics
Join EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

---Next lets add our CASE stmt. We want to give Salesman a 10% raise, Accountant a 5% raise and HR a 0.00001% raise and others a 3% raise. And
---rename the column as SalaryAfterRaise

SELECT FirstName,LastName,JobTitle,Salary,
CASE
WHEN JobTitle='Salesman' THEN Salary+(Salary*0.10)
WHEN JobTitle='Accountant' THEN Salary+(Salary*0.5)
WHEN JobTitle='HR' THEN Salary+(Salary*0.00001)
ELSE Salary+(Salary*0.3)
END AS SalaryAfterRaise
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

---Our script works! The SalaryAfterRaise Column shows the salary each employee would receive after the case statement is applied.