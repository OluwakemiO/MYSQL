UPDATE EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName='Holly' AND LastName='FLAX'

SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET Age = 35, Gender='Female'
WHERE FirstName='Holly' AND LastName='FLAX'

UPDATE EmployeeDemographics
SET Age = 31
WHERE EmployeeID=1013

DELETE 
FROM EmployeeDemographics
WHERE EmployeeID=1013

INSERT [SQL Tutorial].dbo.EmployeeDemographics VALUES
(1013,'Darryl','Phibin',31,'Male')

