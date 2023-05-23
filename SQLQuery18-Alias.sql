---ALIASING IS TEMPORARILY CHANGING A COLUMN NAME OR TABLE NAME IN A SCRIPT WITHOUT 
---IMPACTING YOUR OUTPUT. IT IS USED BASICALLY TO IMPROVE THE READABILITY OF YOUR 
---SCRIPT SO THAT WHEN SOMEONE COMES BEHIND YOU TO WORK ON THE SCRIPT, THEY CAN EASILY UNDERSTAND IT.
---THEY OFTEN MAKE COLUMN NAMES MORE READABLE

---THIS SCRIPT COMBINES THE FIRSTNAME AND LASTNAME INTO A SINGLE COLUMN AND GIVES THE OUTPUT COLUMN AN ALIAS CALLED FULLNAME
SELECT FirstName + '     ' + Lastname AS Fullname
FROM EmployeeDemographics
---THIS SCRIPT GIVES THE FIRSTNAME COLUMN AN ALIAS FName
SELECT FirstName as FName
FROM EmployeeDemographics

---THIS SCRIPT FINDS THE AVERAGE AGE AND GIVES THE OUTPUT COLUMN AN ALIAS AVGAGE
SELECT AVG(AGE) AS AVGAGE
from EmployeeDemographics 

--These are aliase in column name
--Now let's look at aliase in table names

SELECT*
FROM EmployeeDemographics AS EDemo
LEFT JOIN EmployeeSalary AS ESal
ON EDemo.EmployeeID=ESal.EmployeeID

---THE ABOVE SCRIPT IS SIMPLY SAYING THAT THE EMPLOYEEDEMOGRAPHIC TABLE IS GIVEN AN ALIAS EDEM WHILE
---THE EMPLOYEESALARY TABLE IS GIVEN THE ALIAS ESAL. NOW LEFT JOIN ALL THE CONTENT OF THE EDEM AND ESAL
---TABLES USING THE EMPLOYEEID. LEFT JOIN MEANS WE'RE TAKING EVERYTHING FROM THE EDEMO TABLE REGARDLESS 
---OF WHETHER ITS CONTAINED IN THE ESAL TABLE

SELECT EDemo.EmployeeID, ESal.Salary
FROM EmployeeDemographics AS EDemo
LEFT JOIN EmployeeSalary AS ESal
ON EDemo.EmployeeID = ESal.EmployeeID

select*
from EmployeeDemographics
order by EmployeeID asc



--In the script above, We're basically saying create an alias for employeedemographics
--AS EDemo and EmployeeSalary AS ESal. Then LEFT JOIN the two tables using the 
--unique Identifire (EmployeeID) to show only the EmployeeID and Salary.
--If we decide to add more to our select command then it will look like this

SELECT *
FROM WareHouseEmployeeDemographics

SELECT EDemo.EmployeeID, ESal.Salary, WDemo.Age
FROM EmployeeDemographics AS EDemo
LEFT JOIN EmployeeSalary AS ESal
ON EDemo.EmployeeID = ESal.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics AS WDemo
ON EDemo.EmployeeID=WDemo.EmployeeID

---OR WE COULD REPRESENT EACH TABLE WITH LETTERS/ALPHABETHS AS SHOWN:

SELECT A.EmployeeID, B.Salary, C.Age
FROM EmployeeDemographics AS A
LEFT JOIN EmployeeSalary AS B
ON A.EmployeeID = B.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics AS C
ON A.EmployeeID=C.EmployeeID



SELECT FirstName,LastName,Gender,Salary,COUNT(Gender) 
OVER (PARTITION BY GENDER) AS TotalGender
FROM EmployeeDemographics AS EDem
JOIN EmployeeSalary AS ESal
ON EDem.EmployeeID=ESal.EmployeeID