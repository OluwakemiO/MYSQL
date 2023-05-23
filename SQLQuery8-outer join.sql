SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT *
FROM [SQL Tutorial].DBO.EmployeeDemographics
FULL OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID