USE [Product_Task2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.07.2022 14:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.07.2022 14:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAndCategory]    Script Date: 21.07.2022 14:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAndCategory](
	[Id_Product] [int] NOT NULL,
	[Id_Category] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductAndCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductAndCategory_Category] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAndCategory] CHECK CONSTRAINT [FK_ProductAndCategory_Category]
GO
ALTER TABLE [dbo].[ProductAndCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductAndCategory_Product] FOREIGN KEY([Id_Product])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAndCategory] CHECK CONSTRAINT [FK_ProductAndCategory_Product]
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 21.07.2022 14:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAll] AS
BEGIN
    SELECT p.Name AS ProductN, c.Name AS CategoryN
    FROM Product AS p
	LEFT JOIN ProductAndCategory AS pc on p.Id = pc.Id_Product
	LEFT JOIN Category AS c on c.Id = pc.Id_Category
END;
GO
