USE [Product_Task2]
GO

INSERT INTO [dbo].[Category]
           ([Name])
     VALUES
           ('A'),
		   ('B'),
		   ('C'),
		   ('D'),
		   ('E')
GO

USE [Product_Task2]
GO

INSERT INTO [dbo].[Product]
           ([Name])
     VALUES
           ('Dark Souls'),
		   ('Crusader Kings 3'),
		   ('Rocket League'),
		   ('Dota'),
		   ('Civilization VI'),
		   ('Hell Let Loose')
GO

USE [Product_Task2]
GO

INSERT INTO [dbo].[ProductAndCategory]
           ([Id_Product]
           ,[Id_Category])
     VALUES
           (1 ,2),
		   (1 ,3),
		   (2 ,1),
		   (2 ,2),
		   (2 ,4),
		   (3 ,4),
		   (5 ,1),
		   (5 ,2),
		   (5 ,3),
		   (6 ,4)
GO