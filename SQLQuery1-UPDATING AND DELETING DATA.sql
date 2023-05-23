---UPDATING AND DELETING DATA
SELECT*
FROM EmployeeDemographics

---IF WE HAVE AN EMPLOYEE WITHOUT AN EMPLOYEEID ON THE EMPLOYEEDEM TABLE WE CAN UPDATE THE RECORDS WITH THE FOLLOWING SCRIPT


UPDATE EmployeeDemographics
SET EmployeeID=1010
WHERE FirstName='Ryan'

---EmployeeId for Ryan is changed from 1011 to 1010

SELECT*
FROM EmployeeDemographics
ORDER BY EmployeeID ASC

---IF WE HAVE AN EMPLOYEE WITHOUT AN EMPLOYEEID,AGE AND GENDER ON THE EMPLOYEEDEM TABLE WE CAN UPDATE THE RECORDS WITH THE FOLLOWING SCRIPT

INSERT INTO EmployeeDemographics Values
(1018,'Ginger','Hokk',37,'Female')

---Ginger was first inserted as above information. We can change this information using the UPDATE statement below

UPDATE EmployeeDemographics
SET EmployeeID=1019,Age=32,Gender='Male'
WHERE FirstName='Ginger' AND LastName='Hokk'

---USING THE DELETE STATEMENT
---THIS SCRIPT DELETES ALL THE RECORDS IN THE ENTIRE ROW WITH EMPLOYEEID=1019

DELETE FROM EmployeeDemographics
WHERE EmployeeID=1019

---TO AVOID DELETING AN ENTIRE TABLE IN ERROR, FIRST DO A SELECT STATEMENT TO SELECT THE 
---PARTICULAR ROW YOU WANT TO DELETE, AFTER WHICH YOU CAN REPLATE THE SELECT STATEMENT WITH DELETE

SELECT*
FROM EmployeeDemographics
WHERE EmployeeID=1018

DELETE FROM EmployeeDemographics
WHERE EmployeeID=1018


---I want to change employee1d 1019 to 1017 with this script

UPDATE EmployeeDemographics
SET EmployeeID=1017
WHERE FirstName='Anita' AND LastName='Brown'