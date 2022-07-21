USE [master]
GO
/****** Object:  Database [Product_Task2]    Script Date: 21.07.2022 14:25:19 ******/
CREATE DATABASE [Product_Task2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Product_Task2', FILENAME = N'C:\Users\Yurii_S\Product_Task2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Product_Task2_log', FILENAME = N'C:\Users\Yurii_S\Product_Task2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Product_Task2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Product_Task2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Product_Task2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Product_Task2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Product_Task2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Product_Task2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Product_Task2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Product_Task2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Product_Task2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Product_Task2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Product_Task2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Product_Task2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Product_Task2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Product_Task2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Product_Task2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Product_Task2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Product_Task2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Product_Task2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Product_Task2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Product_Task2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Product_Task2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Product_Task2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Product_Task2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Product_Task2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Product_Task2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Product_Task2] SET  MULTI_USER 
GO
ALTER DATABASE [Product_Task2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Product_Task2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Product_Task2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Product_Task2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Product_Task2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Product_Task2] SET QUERY_STORE = OFF
GO
USE [Product_Task2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Product_Task2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.07.2022 14:25:19 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 21.07.2022 14:25:19 ******/
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
/****** Object:  Table [dbo].[ProductAndCategory]    Script Date: 21.07.2022 14:25:19 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 21.07.2022 14:25:19 ******/
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
USE [master]
GO
ALTER DATABASE [Product_Task2] SET  READ_WRITE 
GO



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