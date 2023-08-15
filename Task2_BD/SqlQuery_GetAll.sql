USE [Product_Task2]
GO

DECLARE @RC int

-- TODO: задайте здесь значения параметров.

EXECUTE @RC = [dbo].[GetAll] 
GO


-- Или просто запрос

SELECT p.Name AS ProductN, c.Name AS CategoryN
    FROM Product AS p
	LEFT JOIN ProductAndCategory AS pc on p.Id = pc.Id_Product
	LEFT JOIN Category AS c on c.Id = pc.Id_Category