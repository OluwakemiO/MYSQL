SELECT FIRSTNAME,LASTNAME,JOBTITLE,SALARY,
CASE
WHEN JOBTITLE='SALESMAN' THEN SALARY +(SALARY *.10)

ELSE SALARY + (SALARY *.03)
END AS SALARYAFTERRAISE
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID