---HAVING CLAUSE---
SELECT *
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT JobTitle,COUNT(JOBTITLE)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle

--We cannot use the WHERE stmt with the GROUP BY stmt to state a condition. It will give us the error message:
--'An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list,
--and the column being aggregated is an outer reference.'
.
SELECT JobTitle,COUNT(JOBTITLE)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE COUNT(JOBTITLE) >1
GROUP BY JobTitle

---so what We can do is to use the 'HAVING' clause. In this scenerio, we will use the HAVING clause with the GROUP BY stmt 
---to select which job title has more than 1 count i.e

SELECT JobTitle,COUNT(JOBTITLE)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JOBTITLE) >1

--NOTE THAT the HAVING clause must appear after the GROUP BY stmt and not before.
-- Another scenerio is to use the HAVING clause with the GROUP BY and ORDER BY stmts to get the average salary that is greater than a specified amount. ie

SELECT JobTitle,AVG(SALARY)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(SALARY)

---Above script gives us the average salary for each job title. Now we need the Average salary greater than 45,000 i.e

SELECT JobTitle,AVG(SALARY)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(SALARY)>45000
ORDER BY AVG(SALARY)

---NOTE that the HAVING clause comes afetr the GROUP BY stmt but before the ORDER BY stmt.

SELECT *
FROM EmployeeDemographics

SELECT *
FROM EmployeeSalary