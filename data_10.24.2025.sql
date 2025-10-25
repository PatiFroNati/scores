USE [master]
GO
/****** Object:  Database [rifle]    Script Date: 10/24/2025 8:56:09 PM ******/
CREATE DATABASE [rifle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rifle', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rifle.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rifle_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rifle_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [rifle] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rifle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rifle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rifle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rifle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rifle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rifle] SET ARITHABORT OFF 
GO
ALTER DATABASE [rifle] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [rifle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rifle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rifle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rifle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rifle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rifle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rifle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rifle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rifle] SET  ENABLE_BROKER 
GO
ALTER DATABASE [rifle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rifle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rifle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rifle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rifle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rifle] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rifle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rifle] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rifle] SET  MULTI_USER 
GO
ALTER DATABASE [rifle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rifle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rifle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rifle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rifle] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rifle] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [rifle] SET QUERY_STORE = OFF
GO
USE [rifle]
GO
/****** Object:  Table [dbo].[tr_match_course]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_match_course](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tr_distance]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_distance](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tr_position]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_position](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_event]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_date] [date] NULL,
	[range_id] [int] NULL,
	[match_type_id] [int] NULL,
	[match_course_id] [int] NULL,
	[isCompetition] [bit] NULL,
	[isEIC] [bit] NULL,
	[classRecorded] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_score]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_score](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[competitor_id] [int] NULL,
	[distance_id] [int] NULL,
	[position_id] [int] NULL,
	[slow_rapid] [char](1) NULL,
	[score] [decimal](10, 2) NULL,
	[shotCount] [int] NULL,
	[sighterCount] [int] NULL,
	[scoreShotCount] [int] NULL,
	[xCount] [int] NULL,
	[ammo] [varchar](50) NULL,
	[rifle] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[lv_willScores]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[lv_willScores] AS
select a.id, a.event_date, e.description as course, c.description as distance, d.description as position, b.slow_rapid, b.score, b.score/(b.shotCount * 10) as pct, b.score/(b.scoreShotCount * 10) as official_pct, a.isCompetition, b.ammo, b.rifle
FROM T_EVENT a
JOIN T_SCORE b on a.id = b.event_id
JOIN tr_distance c on b.distance_id = c.id
JOIN tr_position d on b.position_id = d.id
JOIN tr_match_course e on a.match_course_id = e.id
where b.competitor_id = 490030 -- william
and a.match_type_id = 1 -- highpower
GO
/****** Object:  Table [dbo].[t_competitor]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_competitor](
	[cmp_number] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[cmp_rank] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cmp_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_range]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_range](
	[range_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[range_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tr_match_type]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_match_type](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tr_rifle]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_rifle](
	[serial_number] [varchar](20) NOT NULL,
	[description] [varchar](50) NULL,
	[caliber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[t_competitor] ([cmp_number], [name], [cmp_rank]) VALUES (490030, N'William Desgrange', N'Marksman')
GO
INSERT [dbo].[t_competitor] ([cmp_number], [name], [cmp_rank]) VALUES (492576, N'Patrick Desgrange', N'Unranked')
GO
SET IDENTITY_INSERT [dbo].[t_event] ON 
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (1, CAST(N'2025-04-16' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (2, CAST(N'2025-04-23' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (3, CAST(N'2025-04-30' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (4, CAST(N'2025-05-04' AS Date), 1, 1, 2, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (5, CAST(N'2025-05-07' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (6, CAST(N'2025-05-14' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (7, CAST(N'2025-05-28' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (8, CAST(N'2025-05-31' AS Date), 1, 1, 2, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (9, CAST(N'2025-06-01' AS Date), 1, 1, 3, 1, 1, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (10, CAST(N'2025-06-18' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (11, CAST(N'2025-06-25' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (12, CAST(N'2025-06-28' AS Date), 2, 1, 2, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (13, CAST(N'2025-06-29' AS Date), 2, 1, 4, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (14, CAST(N'2025-06-29' AS Date), 2, 1, 3, 1, 1, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (15, CAST(N'2025-07-02' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (16, CAST(N'2025-07-06' AS Date), 1, 1, 2, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (17, CAST(N'2025-07-09' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (18, CAST(N'2025-07-16' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (19, CAST(N'2025-07-23' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (20, CAST(N'2025-07-27' AS Date), 2, 1, 6, 1, 1, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (21, CAST(N'2025-07-28' AS Date), 2, 1, 4, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (22, CAST(N'2025-07-29' AS Date), 2, 1, 3, 1, 1, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (23, CAST(N'2025-07-30' AS Date), 2, 1, 3, 1, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (24, CAST(N'2025-08-10' AS Date), 1, 1, 3, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (25, CAST(N'2025-08-13' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (26, CAST(N'2025-08-20' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (27, CAST(N'2025-08-27' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (28, CAST(N'2025-09-03' AS Date), 1, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (29, CAST(N'2025-09-07' AS Date), 1, 1, 2, 1, 0, 1)
GO
INSERT [dbo].[t_event] ([id], [event_date], [range_id], [match_type_id], [match_course_id], [isCompetition], [isEIC], [classRecorded]) VALUES (30, CAST(N'2025-09-10' AS Date), 1, 1, 1, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[t_event] OFF
GO
INSERT [dbo].[t_range] ([range_id], [name], [city], [state]) VALUES (1, N'Miami Rifle and Pistol Club', N'Batavia', N'OH')
GO
INSERT [dbo].[t_range] ([range_id], [name], [city], [state]) VALUES (2, N'Camp Perry', N'Port Clinton', N'OH')
GO
SET IDENTITY_INSERT [dbo].[t_score] ON 
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (1, 1, 490030, 1, 1, N'S', CAST(112.00 AS Decimal(10, 2)), 18, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (2, 1, 490030, 1, 2, N'R', CAST(157.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (3, 2, 490030, 2, 3, N'R', CAST(128.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (4, 2, 490030, 3, 3, N'S', CAST(57.00 AS Decimal(10, 2)), 12, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (5, 3, 490030, 1, 1, N'S', CAST(98.00 AS Decimal(10, 2)), 16, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (6, 3, 490030, 1, 2, N'R', CAST(156.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (7, 4, 490030, 1, 1, N'S', CAST(128.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (8, 4, 490030, 1, 2, N'R', CAST(161.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (9, 4, 490030, 2, 3, N'R', CAST(165.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (10, 4, 490030, 3, 3, N'S', CAST(110.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (11, 5, 490030, 2, 3, N'R', CAST(110.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (12, 5, 490030, 3, 3, N'S', CAST(165.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (13, 6, 490030, 1, 1, N'S', CAST(93.00 AS Decimal(10, 2)), 18, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (14, 6, 490030, 1, 2, N'R', CAST(161.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (15, 7, 490030, 1, 1, N'S', CAST(97.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (16, 7, 490030, 1, 2, N'R', CAST(180.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (17, 8, 490030, 1, 1, N'S', CAST(130.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (18, 8, 490030, 1, 2, N'R', CAST(179.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (19, 8, 490030, 2, 3, N'R', CAST(157.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (20, 8, 490030, 3, 3, N'S', CAST(110.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (21, 9, 490030, 1, 1, N'S', CAST(66.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (22, 9, 490030, 1, 2, N'R', CAST(91.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (23, 9, 490030, 2, 3, N'R', CAST(79.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (24, 9, 490030, 3, 3, N'S', CAST(151.00 AS Decimal(10, 2)), 20, 0, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (25, 10, 490030, 2, 3, N'R', CAST(127.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (26, 10, 490030, 3, 3, N'S', CAST(152.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (27, 11, 490030, 1, 1, N'S', CAST(97.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (28, 11, 490030, 1, 2, N'R', CAST(164.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (29, 12, 490030, 1, 1, N'S', CAST(132.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (30, 12, 490030, 1, 2, N'R', CAST(160.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (31, 12, 490030, 2, 3, N'R', CAST(171.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (32, 12, 490030, 3, 3, N'S', CAST(153.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (33, 13, 490030, 1, 1, N'S', CAST(42.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (34, 13, 490030, 2, 3, N'R', CAST(70.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (35, 13, 490030, 3, 3, N'S', CAST(76.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (36, 14, 490030, 1, 1, N'S', CAST(56.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (37, 14, 490030, 1, 2, N'R', CAST(73.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (38, 14, 490030, 2, 3, N'R', CAST(83.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (39, 14, 490030, 3, 3, N'S', CAST(126.00 AS Decimal(10, 2)), 20, 1, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (40, 15, 490030, 2, 3, N'R', CAST(162.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (41, 15, 490030, 3, 3, N'S', CAST(154.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (42, 16, 490030, 1, 1, N'S', CAST(130.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (43, 16, 490030, 1, 2, N'R', CAST(164.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (44, 16, 490030, 2, 3, N'R', CAST(167.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (45, 16, 490030, 3, 3, N'S', CAST(143.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (46, 17, 490030, 1, 1, N'S', CAST(139.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (47, 17, 490030, 1, 2, N'R', CAST(161.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (48, 18, 490030, 2, 3, N'R', CAST(130.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (49, 18, 490030, 3, 3, N'S', CAST(159.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (50, 19, 490030, 1, 1, N'S', CAST(147.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (51, 19, 490030, 1, 2, N'R', CAST(187.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (52, 20, 490030, 1, 1, N'S', CAST(82.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Frontier 55gr 5.56mm', N'CMP_M16')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (53, 20, 490030, 1, 2, N'R', CAST(84.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Frontier 55gr 5.56mm', N'CMP_M16')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (54, 20, 490030, 1, 3, N'S', CAST(92.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Frontier 55gr 5.56mm', N'CMP_M16')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (55, 20, 490030, 1, 3, N'R', CAST(87.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Frontier 55gr 5.56mm', N'CMP_M16')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (56, 21, 490030, 1, 1, N'S', CAST(63.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (57, 21, 490030, 2, 3, N'R', CAST(83.00 AS Decimal(10, 2)), 9, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (58, 21, 490030, 3, 3, N'S', CAST(79.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (59, 22, 490030, 1, 1, N'S', CAST(70.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (60, 22, 490030, 1, 2, N'R', CAST(81.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (61, 22, 490030, 2, 3, N'R', CAST(78.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (62, 22, 490030, 3, 3, N'S', CAST(128.00 AS Decimal(10, 2)), 20, 0, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (63, 23, 490030, 1, 1, N'S', CAST(86.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (64, 23, 490030, 1, 2, N'R', CAST(92.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (65, 23, 490030, 2, 3, N'R', CAST(82.00 AS Decimal(10, 2)), 10, 0, 10, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (66, 23, 490030, 3, 3, N'S', CAST(159.00 AS Decimal(10, 2)), 20, 0, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (67, 24, 490030, 1, 1, N'S', CAST(79.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (68, 24, 490030, 1, 2, N'R', CAST(88.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (69, 24, 490030, 2, 3, N'R', CAST(93.00 AS Decimal(10, 2)), 10, 2, 10, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (70, 24, 490030, 2, 3, N'S', CAST(180.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (71, 25, 490030, 2, 3, N'R', CAST(166.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (72, 25, 490030, 3, 3, N'S', CAST(165.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Club Ammo 77gr Monkey Loader', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (73, 26, 490030, 1, 1, N'S', CAST(160.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (74, 26, 490030, 1, 2, N'R', CAST(189.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (75, 27, 490030, 2, 3, N'R', CAST(179.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (76, 27, 490030, 3, 3, N'S', CAST(172.00 AS Decimal(10, 2)), 20, 2, 20, NULL, N'Sig Sauer 77gr .223', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (77, 28, 490030, 1, 1, N'S', CAST(159.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (78, 28, 490030, 1, 2, N'R', CAST(170.00 AS Decimal(10, 2)), 20, 2, 20, 0, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (79, 29, 490030, 1, 1, N'S', CAST(160.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (80, 29, 490030, 1, 2, N'R', CAST(175.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (81, 29, 490030, 2, 3, N'R', CAST(167.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (82, 29, 490030, 3, 3, N'S', CAST(178.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'Sig Sauer 77gr .223', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (83, 30, 490030, 2, 3, N'R', CAST(169.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'AAC 77gr 5.56mm', N'AP132398')
GO
INSERT [dbo].[t_score] ([id], [event_id], [competitor_id], [distance_id], [position_id], [slow_rapid], [score], [shotCount], [sighterCount], [scoreShotCount], [xCount], [ammo], [rifle]) VALUES (84, 30, 490030, 3, 3, N'S', CAST(179.00 AS Decimal(10, 2)), 20, 2, 20, 1, N'Sig Sauer 77gr .223', N'AP132398')
GO
SET IDENTITY_INSERT [dbo].[t_score] OFF
GO
INSERT [dbo].[tr_distance] ([id], [description]) VALUES (1, N'200yd')
GO
INSERT [dbo].[tr_distance] ([id], [description]) VALUES (2, N'300yd')
GO
INSERT [dbo].[tr_distance] ([id], [description]) VALUES (3, N'600yd')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (1, N'Wednesday Night League')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (2, N'CMP Highpower Rifle Standard 80rd')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (3, N'CMP National Match 50rd')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (4, N'CMP President''s Rifle Match 30rd')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (5, N'CMP Mid-range 3 X 600 Match 60rd')
GO
INSERT [dbo].[tr_match_course] ([id], [description]) VALUES (6, N'CMP M16 EIC Match 40rd')
GO
INSERT [dbo].[tr_match_type] ([id], [description]) VALUES (1, N'Highpower Rifle')
GO
INSERT [dbo].[tr_match_type] ([id], [description]) VALUES (2, N'Air Rifle')
GO
INSERT [dbo].[tr_match_type] ([id], [description]) VALUES (3, N'Smallbore Rifle')
GO
INSERT [dbo].[tr_position] ([id], [description]) VALUES (1, N'Standing')
GO
INSERT [dbo].[tr_position] ([id], [description]) VALUES (2, N'Sitting')
GO
INSERT [dbo].[tr_position] ([id], [description]) VALUES (3, N'Prone')
GO
INSERT [dbo].[tr_position] ([id], [description]) VALUES (4, N'Kneeling')
GO
INSERT [dbo].[tr_rifle] ([serial_number], [description], [caliber]) VALUES (N'AP132398', N'Rock River Arms NM A4 20" CMP Rifle', N'.223/5.56mm')
GO
INSERT [dbo].[tr_rifle] ([serial_number], [description], [caliber]) VALUES (N'CMP_M16', N'CMP loaner', N'.223/5.56mm')
GO
/****** Object:  Index [idx_cmp_number]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_cmp_number] ON [dbo].[t_competitor]
(
	[cmp_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_event_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_event_id] ON [dbo].[t_event]
(
	[id] ASC,
	[range_id] ASC,
	[match_type_id] ASC,
	[match_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_range_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_range_id] ON [dbo].[t_range]
(
	[range_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_score_event_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_score_event_id] ON [dbo].[t_score]
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_distance_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_distance_id] ON [dbo].[tr_distance]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_match_course_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_match_course_id] ON [dbo].[tr_match_course]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_match_type_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_match_type_id] ON [dbo].[tr_match_type]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_position_id]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_position_id] ON [dbo].[tr_position]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_rifle_serial_number]    Script Date: 10/24/2025 8:56:10 PM ******/
CREATE NONCLUSTERED INDEX [idx_rifle_serial_number] ON [dbo].[tr_rifle]
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_event]  WITH CHECK ADD FOREIGN KEY([match_course_id])
REFERENCES [dbo].[tr_match_course] ([id])
GO
ALTER TABLE [dbo].[t_event]  WITH CHECK ADD FOREIGN KEY([match_type_id])
REFERENCES [dbo].[tr_match_type] ([id])
GO
ALTER TABLE [dbo].[t_event]  WITH CHECK ADD FOREIGN KEY([range_id])
REFERENCES [dbo].[t_range] ([range_id])
GO
ALTER TABLE [dbo].[t_score]  WITH CHECK ADD FOREIGN KEY([competitor_id])
REFERENCES [dbo].[t_competitor] ([cmp_number])
GO
ALTER TABLE [dbo].[t_score]  WITH CHECK ADD FOREIGN KEY([distance_id])
REFERENCES [dbo].[tr_distance] ([id])
GO
ALTER TABLE [dbo].[t_score]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[t_event] ([id])
GO
ALTER TABLE [dbo].[t_score]  WITH CHECK ADD FOREIGN KEY([position_id])
REFERENCES [dbo].[tr_position] ([id])
GO
ALTER TABLE [dbo].[t_score]  WITH CHECK ADD FOREIGN KEY([rifle])
REFERENCES [dbo].[tr_rifle] ([serial_number])
GO
/****** Object:  StoredProcedure [dbo].[GetRifleLastShots]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetRifleLastShots]
    @competitor_id INT,
    @match_type_id INT,
    @num_shots INT = 100,
    @scoreCalculated NVARCHAR(10) = 'Both'

/* 
Exec GetRifleLastShots @competitor_id = 490030, @match_type_id = 1, @num_shots = 240, @scoreCalculated = 'Both'

scoreCalculate can be 'Both', 'True', or 'False'

Pulls the last @num_shots shots for the competitor in the match type, and calculates the average percentage of scores in each position.
Use to track future goals for the competitor. 
*/

AS
WITH NumberedScores AS (
    select 
        a.id, 
        a.event_date, 
        e.description as course, 
        c.description as distance, 
        d.description as position, 
        b.slow_rapid, 
        b.score,
		b.shotCount, 
        b.score/(b.shotCount * 10) as pct, 
        b.score/(b.scoreShotCount * 10) as official_pct,
        SUM(shotCount) OVER (
            PARTITION BY c.description, d.description, b.slow_rapid 
            ORDER BY a.event_date DESC
        ) as shot_count,
        a.isCompetition, 
        b.ammo, 
        b.rifle
    FROM T_EVENT a
    JOIN T_SCORE b on a.id = b.event_id
    JOIN tr_distance c on b.distance_id = c.id
    JOIN tr_position d on b.position_id = d.id
    JOIN tr_match_course e on a.match_course_id = e.id
        where b.competitor_id = @competitor_id
        and a.match_type_id = @match_type_id
        and (@scoreCalculated = 'Both' OR 
             (@scoreCalculated = 'True' AND a.classRecorded = 1) OR
             (@scoreCalculated = 'False' AND a.classRecorded = 0))
),
GroupBoundaries as
(
    SELECT 
        distance,
        position,
        slow_rapid,
        event_date,
        MIN(shot_count) as first_in_group,
        LEAD(MIN(shot_count)) OVER (PARTITION BY distance, position, slow_rapid ORDER BY event_date) as last_in_group
    FROM NumberedScores
    GROUP BY distance, position, slow_rapid, event_date
)
SELECT n.* ,
AVG(n.score / (n.shotCount * 10)) OVER (PARTITION BY n.distance, n.position, n.slow_rapid) as avg_pct
FROM NumberedScores n
JOIN GroupBoundaries g ON 
    n.distance = g.distance AND 
    n.position = g.position AND 
    n.slow_rapid = g.slow_rapid AND 
    n.event_date = g.event_date
WHERE n.shot_count <= @num_shots OR (g.first_in_group >= @num_shots AND g.last_in_group < @num_shots)
ORDER BY n.distance, n.position, n.slow_rapid, n.event_date DESC;
GO
/****** Object:  StoredProcedure [dbo].[GetRifleLastShotsOverall]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetRifleLastShotsOverall]
    @competitor_id INT,
    @match_type_id INT,
    @num_shots INT = 240,
    @scoreCalculated NVARCHAR(10) = 'Both'

/* 
Exec GetRifleLastShotsOverall @competitor_id = 490030, @match_type_id = 1, @num_shots = 240, @scoreCalculated = 'True'

scoreCalculate can be 'Both', 'True', or 'False'

Pulls the last @num_shots shots for the competitor in the match type, and calculates the overall average percentage 
across all positions, distances, and slow/rapid fire combined.
*/

AS
WITH ShotGroups AS (
    SELECT 
        a.id,
        a.event_date,
        e.description as course,
        c.description as distance,
        d.description as position,
        b.slow_rapid,
        b.score,
        b.shotCount,
        b.scoreShotCount,
        b.score/(b.scoreshotCount * 10) as pct,
        b.score/(b.scoreShotCount * 10) as official_pct,
        SUM(b.scoreShotCount) OVER (ORDER BY a.event_date DESC, a.id DESC) as running_shot_count,
        a.isCompetition,
        b.ammo,
        b.rifle
    FROM T_EVENT a
    JOIN T_SCORE b on a.id = b.event_id
    JOIN tr_distance c on b.distance_id = c.id
    JOIN tr_position d on b.position_id = d.id
    JOIN tr_match_course e on a.match_course_id = e.id
    WHERE b.competitor_id = @competitor_id
        and a.match_type_id = @match_type_id
        and (@scoreCalculated = 'Both' OR
        (@scoreCalculated = 'True' AND a.classRecorded = 1) OR
        (@scoreCalculated = 'False' AND a.classRecorded = 0))
),
GroupBoundaries AS (
    SELECT 
        id,
        event_date,
        MIN(running_shot_count) as first_in_group,
        LEAD(MIN(running_shot_count)) OVER (ORDER BY event_date DESC, id DESC) as next_group_shots
    FROM ShotGroups
    GROUP BY id, event_date
)
SELECT 
    s.*,
    SUM(s.score) OVER () / SUM(s.scoreShotCount * 10) OVER () as overall_avg_pct
FROM ShotGroups s
JOIN GroupBoundaries g ON s.id = g.id AND s.event_date = g.event_date
WHERE s.running_shot_count <= @num_shots 
    OR (g.first_in_group >= @num_shots AND g.next_group_shots < @num_shots)
ORDER BY s.event_date DESC, s.id DESC;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClassificationStats]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetClassificationStats]
AS
/*
EXEC sp_GetClassificationStats
*/

BEGIN
    -- Create temp table for first result set
    CREATE TABLE #EventScores 
    (
        id int,
        event_date date,
        score decimal(10,2),
        shots int,
        pot_score int
    )

    -- Create index on temp table
    CREATE INDEX idx_event_scores ON #EventScores(event_date DESC, id DESC)

    -- Insert aggregated event scores
    INSERT INTO #EventScores
    SELECT a.id, a.event_date, SUM(score) as score, SUM(scoreShotCount) as shots, SUM(scoreShotCount *10) as pot_score
    FROM T_EVENT a
    JOIN T_SCORE b on a.id = b.event_id
    WHERE classRecorded = 1
    GROUP BY a.id, a.event_date

    -- Create temp table for final results
    CREATE TABLE #FinalScores
    (
        id int,
        event_date date,
        score decimal(10,2),
        shots int, 
        pot_score int,
        pct decimal(10,4),
        shot_run_sum int,
        score_run_sum decimal(10,2)
    )

    -- Insert final calculated results
    INSERT INTO #FinalScores
    SELECT 
        id,
        event_date,
        score,
        shots,
        pot_score,
        CAST(score AS decimal(10,4)) / CAST(pot_score AS decimal(10,4)) as pct,
        SUM(shots) OVER (ORDER BY event_date DESC, id DESC) as shot_run_sum,
        SUM(score) OVER (ORDER BY event_date DESC, id DESC) as score_run_sum
    FROM #EventScores
    GROUP BY id, event_date, score, shots, pot_score

    -- Return final result set
    SELECT *, score_run_sum / shot_run_sum * 10
    FROM #FinalScores 
    WHERE (shot_run_sum - shots) < 240

    -- Clean up temp tables
    DROP TABLE #EventScores
    DROP TABLE #FinalScores
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEvent]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_InsertEvent '2025-09-10', 1, 1, 1, 0, 0,0

CREATE PROCEDURE [dbo].[sp_InsertEvent]
    @event_date DATE,
    @range_id INT, -- 1 = MRPC, 2 = Camp Perry
    @match_type_id INT, --1 = highpower
    @match_course_id INT, -- 1 = Wed, 2 = 80Rd, 3 = 50rd, 4 = 30 rd
    @isCompetition BIT,
    @isEIC BIT,
    @classRecorded BIT
AS
BEGIN
    --insert new event
    insert into t_event (event_date, range_id, match_type_id, match_course_id, isCompetition, isEIC, classRecorded) 
    values (@event_date, @range_id, @match_type_id, @match_course_id, @isCompetition, @isEIC, @classRecorded);

    RETURN SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertScore]    Script Date: 10/24/2025 8:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertScore]
    @event_id INT,
    @competitor_id INT,
    @distance_id INT,  -- 1 = 200yd, 2 = 300yd, 3 = 600yd
    @position_id INT,  -- 1 = Standing, 2 = Sitting, 3 = Prone, 4 = Kneeling
    @slow_rapid CHAR(1), -- S for Slow and R for Rapid
    @score DECIMAL(10,2),
    @shotCount INT,
    @sighterCount INT,
    @scoreShotCount INT,
    @xCount INT = NULL,
    @ammo VARCHAR(50),
    @rifle VARCHAR(20)
AS
BEGIN
    --insert scores for the event
    insert into t_score (event_id, competitor_id, distance_id, position_id, slow_rapid, score, shotCount, sighterCount, scoreShotCount, xCount, ammo, rifle) 
    values (@event_id, @competitor_id, @distance_id, @position_id, @slow_rapid, @score, @shotCount, @sighterCount, @scoreShotCount, @xCount, @ammo, @rifle);
END
GO
USE [master]
GO
ALTER DATABASE [rifle] SET  READ_WRITE 
GO
