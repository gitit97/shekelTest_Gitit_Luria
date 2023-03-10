USE [master]
GO
/****** Object:  Database [shekelTest]    Script Date: 02/01/2023 23:59:53 ******/
CREATE DATABASE [shekelTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shekelTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shekelTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shekelTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shekelTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shekelTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shekelTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shekelTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shekelTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shekelTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shekelTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shekelTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [shekelTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shekelTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shekelTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shekelTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shekelTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shekelTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shekelTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shekelTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shekelTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shekelTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shekelTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shekelTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shekelTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shekelTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shekelTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shekelTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shekelTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shekelTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shekelTest] SET  MULTI_USER 
GO
ALTER DATABASE [shekelTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shekelTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shekelTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shekelTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shekelTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shekelTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shekelTest] SET QUERY_STORE = OFF
GO
USE [shekelTest]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02/01/2023 23:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerId] [nvarchar](9) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factories]    Script Date: 02/01/2023 23:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factories](
	[groupCode] [int] NOT NULL,
	[factoryCode] [int] NULL,
	[factoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Factories] PRIMARY KEY CLUSTERED 
(
	[groupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactoriesToCustomer]    Script Date: 02/01/2023 23:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactoriesToCustomer](
	[id] [int] NOT NULL,
	[groupCode] [int] NULL,
	[factoryCode] [int] NULL,
	[customerId] [nvarchar](9) NULL,
 CONSTRAINT [PK_FactoriesToCustomer_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02/01/2023 23:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[groupCode] [int] NOT NULL,
	[groupName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[groupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customers] ([customerId], [name], [address], [phone]) VALUES (N'315794487', N'יהודה', N'צפת 76', N'0527656965')
INSERT [dbo].[Customers] ([customerId], [name], [address], [phone]) VALUES (N'316527233', N'גתית', N'צפת 72', N'0505775749')
GO
INSERT [dbo].[Factories] ([groupCode], [factoryCode], [factoryName]) VALUES (400, 20, N'מפעל א')
GO
INSERT [dbo].[FactoriesToCustomer] ([id], [groupCode], [factoryCode], [customerId]) VALUES (1, 400, 20, N'316527233')
INSERT [dbo].[FactoriesToCustomer] ([id], [groupCode], [factoryCode], [customerId]) VALUES (2, 400, 21, N'228298907')
GO
INSERT [dbo].[Groups] ([groupCode], [groupName]) VALUES (400, N'קבוצה א')
GO
USE [master]
GO
ALTER DATABASE [shekelTest] SET  READ_WRITE 
GO
