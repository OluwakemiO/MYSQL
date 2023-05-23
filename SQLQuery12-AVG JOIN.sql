

SELECT JobTitle,AVG (Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE JobTitle='SALESMAN'
GROUP BY JobTitle