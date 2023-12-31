USE [master]
GO
/****** Object:  Database [clothes]    Script Date: 26.07.2023 11:10:39 ******/
CREATE DATABASE [clothes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clothes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\clothes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clothes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\clothes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [clothes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clothes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clothes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clothes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clothes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clothes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clothes] SET ARITHABORT OFF 
GO
ALTER DATABASE [clothes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clothes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clothes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clothes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clothes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clothes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clothes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clothes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clothes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clothes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clothes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clothes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clothes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clothes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clothes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clothes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clothes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clothes] SET RECOVERY FULL 
GO
ALTER DATABASE [clothes] SET  MULTI_USER 
GO
ALTER DATABASE [clothes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clothes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clothes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clothes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clothes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clothes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'clothes', N'ON'
GO
ALTER DATABASE [clothes] SET QUERY_STORE = ON
GO
ALTER DATABASE [clothes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [clothes]
GO
/****** Object:  Table [dbo].[clothingspec]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clothingspec](
	[Clothes_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clothes_Type] [varchar](50) NULL,
	[Clothes_Quantity] [int] NULL,
	[Clothes_Size] [varchar](50) NULL,
	[Clothes_Colour] [varchar](50) NULL,
	[Clothes_Description] [varchar](max) NULL,
	[Clothes_IssueDate] [smalldatetime] NULL,
	[Customer_Name] [varchar](50) NULL,
 CONSTRAINT [PK_clothingspec] PRIMARY KEY CLUSTERED 
(
	[Clothes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[Customer_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Phone] [varchar](50) NULL,
	[Customer_Location] [varchar](50) NULL,
	[Customer_Date] [smalldatetime] NULL,
	[Customer_Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[process]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[process](
	[prid] [int] IDENTITY(1,1) NOT NULL,
	[prtype] [varchar](50) NULL,
	[prtime] [int] NULL,
	[prcost] [int] NULL,
	[prgenexpenses] [int] NULL,
	[prtoplam] [int] NULL,
	[prest] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[prid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceInformation]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceInformation](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[Service_Name] [varchar](50) NULL,
	[Service_CostGreen] [float] NULL,
	[Service_TimeGreen] [int] NULL,
	[Service_CostSilver] [float] NULL,
	[Service_TimeSilver] [int] NULL,
	[Service_CostGold] [float] NULL,
	[Service_TimeGold] [int] NULL,
	[Clothes_Type] [varchar](50) NULL,
 CONSTRAINT [PK_ServiceInformation] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_Location], [Customer_Date], [Customer_Type]) VALUES (1000, N'', N'', N'', CAST(N'1900-01-01T00:00:00' AS SmallDateTime), N'0')
INSERT [dbo].[customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_Location], [Customer_Date], [Customer_Type]) VALUES (1001, N'Mauro Icardi', N'(190) 519-0534', N'Argentina', CAST(N'2023-05-19T00:00:00' AS SmallDateTime), N'Gold')
INSERT [dbo].[customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_Location], [Customer_Date], [Customer_Type]) VALUES (1002, N'Wilfried Zaha', N'(341) 905-1905', N'Ivory Coast', CAST(N'2023-07-23T00:00:00' AS SmallDateTime), N'Gold')
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceInformation] ON 

INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (2, N'Shorten Height', 38, 4, 34.2, 3, 30.4, 2, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (3, N'Bias-Cut', 50, 6, 45, 4, 40, 3, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (4, N'Side-Seams(Waist)', 40, 3, 36, 2, 32, 1, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (5, N'Side-Seams(Waist)+Zip', 55, 3, 49.5, 2, 44, 2, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (6, N'Side-Seams(Waist)+Boning', 60, 4, 54, 4, 48, 3, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (7, N'Lift Shoulders', 40, 3, 36, 3, 32, 2, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (8, N'Lift Shoulders(Re-setting)', 60, 4, 54, 3, 48, 3, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (9, N'Change Straps', 10, 2, 9, 1, 8, 1, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (10, N'Side-Seams(Waist)', 55, 5, 49.5, 5, 44, 4, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (11, N'Sleeve Lenght', 38, 3, 34.2, 2, 30.4, 1, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (12, N'Reposition Buttons', 58, 2, 52.2, 2, 46.4, 1, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (13, N'Shoulder Narrow', 70, 4, 63, 4, 54, 3, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (14, N'Shoulder Pad Insert', 60, 3, 54, 2, 48, 1, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (15, N'Shorten Jacket', 80, 7, 72, 5, 64, 4, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (16, N'Shorten Coat', 90, 8, 81, 7, 72, 6, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (17, N'Reline J/C', 120, 10, 108, 8, 96, 7, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (18, N'Reline Sleeves', 50, 3, 45, 2, 40, 2, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (19, N'New Zip', 30, 2, 27, 2, 0, 2, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (20, N'Shorten/Lenghten', 30, 3, 27, 2, 0, 2, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (21, N'Taper(Width)', 28, 2, 25.2, 2, 22.4, 1, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (22, N'Waist(Take-In)', 38, 2, 34.2, 2, 30.4, 1, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (23, N'Waist(Let-Out)', 38, 2, 34.2, 2, 30.4, 1, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (24, N'Change Zip', 20, 1, 18, 1, 0, 1, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (25, N'Side-Seams(Waist)', 50, 4, 45, 3, 40, 2, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (26, N'Sleeve Length', 30, 3, 27, 2, 24, 1, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (27, N'Add Cuffs', 15, 2, 13.5, 2, 0, 1, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (28, N'Shoulder Narrow', 50, 3, 45, 2, 40, 2, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (29, N'Shorten Length', 38, 5, 34.2, 4, 30.4, 3, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (30, N'Shorten Length', 30, 4, 27, 3, 24, 2, N'Blazers')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (31, N'Sleeve Length', 20, 2, 18, 2, 0, 1, N'Blazers')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (32, N'Reposition Buttons', 40, 3, 36, 3, 32, 2, N'Blazers')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (33, N'Neckline Re-Shape', 20, 3, 18, 2, 0, 1, N'Blazers')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (34, N'Shortening', 200, 16, 180, 14, 160, 13, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (35, N'Drop into waist-line', 150, 13, 135, 10, 120, 8, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (36, N'Lift the Shoulders', 100, 7, 90, 5, 80, 5, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (37, N'Narrow the Sleeves', 180, 8, 162, 7, 144, 6, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (38, N'Re-Shape Neckline', 200, 11, 180, 10, 160, 9, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (39, N'Replace Zip', 100, 4, 90, 3, 80, 2, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (40, N'Made-To-Measure', 4500, 30, 4050, 27, 3600, 23, N'Bridalwear')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (41, N'Made-To-Measure', 2000, 20, 1800, 17, 1600, 15, N'Blazers')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (42, N'Made-To-Measure', 400, 12, 360, 10, 320, 9, N'Shirts&Blouses')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (43, N'Made-To-Measure', 400, 14, 360, 12, 320, 9, N'Trousers&Jeans')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (44, N'Made-To-Measure', 1500, 18, 1350, 16, 1200, 13, N'Jackets&Coats')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (45, N'Made-To-Measure(Dresses)', 1000, 14, 900, 11, 800, 9, N'Dresses&Skirts')
INSERT [dbo].[ServiceInformation] ([ProcessID], [Service_Name], [Service_CostGreen], [Service_TimeGreen], [Service_CostSilver], [Service_TimeSilver], [Service_CostGold], [Service_TimeGold], [Clothes_Type]) VALUES (46, N'Made-To-Measure(Skirts)', 600, 10, 540, 8, 480, 7, N'Dresses&Skirts')
SET IDENTITY_INSERT [dbo].[ServiceInformation] OFF
GO
/****** Object:  StoredProcedure [dbo].[InsertClothing]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertClothing]


-- kaydetme pros
@Clothes_Type varchar(50),
@Clothes_Quantity int,
@Clothes_Size varchar(50),
@Clothes_Colour varchar(50),
@Clothes_Description varchar(max),
@Clothes_IssueDate smalldatetime,
@Customer_Name varchar(50)
as begin
Insert into clothingspec (Clothes_Type,Clothes_Quantity,Clothes_Size,Clothes_Colour,Clothes_Description,Clothes_IssueDate,Customer_Name) Values(@Clothes_Type,@Clothes_Quantity,@Clothes_Size,@Clothes_Colour,@Clothes_Description,@Clothes_IssueDate,@Customer_Name)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertCustomer]


-- kaydetme pros
@Customer_Name varchar(50),
@Customer_Phone varchar(50),
@Customer_Location varchar(50),
@Customer_Date smalldatetime,
@Customer_Type varchar(50)

as begin
Insert into customer (Customer_Name,Customer_Phone,Customer_Location,Customer_Date,Customer_Type) Values(@Customer_Name,@Customer_Phone,@Customer_Location,@Customer_Date,@Customer_Type)
end
GO
/****** Object:  StoredProcedure [dbo].[ListClothing]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ListClothing]  --listeleme prosedürü

as begin
Select * from clothingspec 
end
GO
/****** Object:  StoredProcedure [dbo].[ListCustomer]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListCustomer]  --listeleme prosedürü

as begin
Select * from customer 
end
GO
/****** Object:  StoredProcedure [dbo].[ListMemType]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListMemType]  --listeleme prosedürü
@Customer_Name varchar(50)
as begin
Select Customer_Type from customer where Customer_Name=@Customer_Name 
end
GO
/****** Object:  StoredProcedure [dbo].[SearchClothing]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SearchClothing] @Customer_Name varchar(50)

as begin
select * from clothingspec where Customer_Name like '%'+@Customer_Name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomer]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchCustomer] 
@Customer_Name varchar(50)

as begin
select * from customer where Customer_Name like '%'+@Customer_Name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[tailorcusdelete]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tailorcusdelete]
@Customer_ID int
as begin
delete from customer where Customer_ID=@Customer_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 26.07.2023 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UpdateCustomer]
@Customer_ID int,
@Customer_Name varchar(50),
@Customer_Phone varchar(50),
@Customer_Location varchar(50),
@Customer_Date smalldatetime,
@Customer_Type varchar(50)
as begin
Update customer set Customer_Name=@Customer_Name , Customer_Phone=@Customer_Phone, Customer_Location=@Customer_Location,Customer_Date=@Customer_Date,Customer_Type=@Customer_Type
WHERE Customer_ID=@Customer_ID
end
GO
USE [master]
GO
ALTER DATABASE [clothes] SET  READ_WRITE 
GO
