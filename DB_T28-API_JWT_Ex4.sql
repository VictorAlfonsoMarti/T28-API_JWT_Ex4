USE [master]
GO
/****** Object:  Database [T28-API_JWT_Ex4]    Script Date: 08/02/2021 17:48:59 ******/
CREATE DATABASE [T28-API_JWT_Ex4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T28-API_JWT_Ex4', FILENAME = N'/var/opt/mssql/data/T28-API_JWT_Ex4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T28-API_JWT_Ex4_log', FILENAME = N'/var/opt/mssql/data/T28-API_JWT_Ex4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [T28-API_JWT_Ex4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ARITHABORT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET RECOVERY FULL 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET  MULTI_USER 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET QUERY_STORE = OFF
GO
USE [T28-API_JWT_Ex4]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 08/02/2021 17:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[NumSerie] [char](4) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Facultad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facultad]    Script Date: 08/02/2021 17:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultad](
	[Codigo] [int] NOT NULL,
	[Nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investigadores]    Script Date: 08/02/2021 17:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investigadores](
	[DNI] [varchar](8) NOT NULL,
	[NomApels] [nvarchar](255) NULL,
	[Facultad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 08/02/2021 17:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[DNI] [varchar](8) NOT NULL,
	[NumSerie] [char](4) NOT NULL,
	[Comienzo] [datetime] NULL,
	[Fin] [datetime] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC,
	[NumSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 08/02/2021 17:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000A', N'Equipo 1', 10)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000B', N'Equipo 2', 9)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000C', N'Equipo 3', 8)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000D', N'Equipo 4', 7)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000E', N'Equipo 5', 6)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000F', N'Equipo 6', 5)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000G', N'Equipo 7', 4)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000H', N'Equipo 8', 3)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000I', N'Equipo 9', 2)
INSERT [dbo].[Equipos] ([NumSerie], [Nombre], [Facultad]) VALUES (N'000J', N'Equipo 10', 1)
GO
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (1, N'Facutlad 1')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (2, N'Facutlad 2')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (3, N'Facutlad 3')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (4, N'Facutlad 4')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (5, N'Facutlad 5')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (6, N'Facutlad 6')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (7, N'Facutlad 7')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (8, N'Facutlad 8')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (9, N'Facutlad 9')
INSERT [dbo].[Facultad] ([Codigo], [Nombre]) VALUES (10, N'Facutlad 10')
GO
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000001', N'Señor X', 1)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000002', N'Señor Y', 2)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000003', N'Señor Z', 3)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000004', N'Señor A', 4)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000005', N'Señor B', 5)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000006', N'Señor C', 6)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000007', N'Señor D', 7)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000008', N'Señor E', 8)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000009', N'Señor F', 9)
INSERT [dbo].[Investigadores] ([DNI], [NomApels], [Facultad]) VALUES (N'00000010', N'Señor Negro', 10)
GO
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000001', N'000J', CAST(N'2001-01-01T00:00:00.000' AS DateTime), CAST(N'2001-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000002', N'000I', CAST(N'2002-02-02T00:00:00.000' AS DateTime), CAST(N'2002-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000003', N'000H', CAST(N'2003-03-03T00:00:00.000' AS DateTime), CAST(N'2003-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000004', N'000G', CAST(N'2004-04-04T00:00:00.000' AS DateTime), CAST(N'2004-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000005', N'000F', CAST(N'2005-05-05T00:00:00.000' AS DateTime), CAST(N'2005-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000006', N'000E', CAST(N'2006-06-06T00:00:00.000' AS DateTime), CAST(N'2006-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000007', N'000D', CAST(N'2007-07-07T00:00:00.000' AS DateTime), CAST(N'2007-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000008', N'000C', CAST(N'2008-08-08T00:00:00.000' AS DateTime), CAST(N'2008-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000009', N'000B', CAST(N'2009-09-09T00:00:00.000' AS DateTime), CAST(N'2009-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([DNI], [NumSerie], [Comienzo], [Fin]) VALUES (N'00000010', N'000A', CAST(N'2010-10-10T00:00:00.000' AS DateTime), CAST(N'2011-11-11T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [FirstName], [LastName], [UserName], [Email], [Password], [CreatedDate]) VALUES (1, N'Piezas', N'Admin', N'PiezasAdmin', N'admin@piezas.com', N'$admin@2021', CAST(N'2021-02-08T17:31:05.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([Facultad])
REFERENCES [dbo].[Facultad] ([Codigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Investigadores]  WITH CHECK ADD FOREIGN KEY([Facultad])
REFERENCES [dbo].[Facultad] ([Codigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([DNI])
REFERENCES [dbo].[Investigadores] ([DNI])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([NumSerie])
REFERENCES [dbo].[Equipos] ([NumSerie])
GO
USE [master]
GO
ALTER DATABASE [T28-API_JWT_Ex4] SET  READ_WRITE 
GO
