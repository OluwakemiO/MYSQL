/****** Script for SelectTopNRows command from SSMS  ******/
SELECT*
FROM [SQL Tutorial].DBO.ExpensesSheet2

SELECT*
FROM [SQL Tutorial].DBO.SalesSheet2


SELECT ExpensesSheet2.Date, ExpensesDescription,SalesDescription
FROM [SQL Tutorial].dbo.ExpensesSheet2
LEFT OUTER JOIN [SQL Tutorial].dbo.SalesSheet2
ON ExpensesSheet2.Date=SalesSheet2.Date