USE [master]
GO
/****** Object:  Database [PracticasLBD]    Script Date: 13/03/2018 11:44:23 a. m. ******/
CREATE DATABASE [PracticasLBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PracticasLBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.YENAI\MSSQL\DATA\PracticasLBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PracticasLBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.YENAI\MSSQL\DATA\PracticasLBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PracticasLBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PracticasLBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PracticasLBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PracticasLBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PracticasLBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PracticasLBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PracticasLBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [PracticasLBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PracticasLBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PracticasLBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PracticasLBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PracticasLBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PracticasLBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PracticasLBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PracticasLBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PracticasLBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PracticasLBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PracticasLBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PracticasLBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PracticasLBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PracticasLBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PracticasLBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PracticasLBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PracticasLBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PracticasLBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PracticasLBD] SET  MULTI_USER 
GO
ALTER DATABASE [PracticasLBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PracticasLBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PracticasLBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PracticasLBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PracticasLBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PracticasLBD] SET QUERY_STORE = OFF
GO
USE [PracticasLBD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PracticasLBD]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 13/03/2018 11:44:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[ID] [uniqueidentifier] NOT NULL,
	[NoCamion] [int] NOT NULL,
	[idEmpleado] [uniqueidentifier] NOT NULL,
	[Modelo] [ntext] NOT NULL,
	[idRuta] [uniqueidentifier] NOT NULL,
	[Matricula] [int] NOT NULL,
	[Asientos] [int] NOT NULL,
	[AsientosOcupados] [int] NOT NULL,
	[AsientosDisponibles]  AS ([Asientos]-[AsientosOcupados]),
 CONSTRAINT [NumeroCamion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/03/2018 11:44:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [uniqueidentifier] NOT NULL,
	[idPersona] [uniqueidentifier] NOT NULL,
	[idCredencial] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 13/03/2018 11:44:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [uniqueidentifier] NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[Puesto] [nvarchar](50) NOT NULL,
	[HorasSemanales] [int] NOT NULL,
	[SueldoHora] [money] NOT NULL,
	[SueldoTotal]  AS ([HorasSemanales]*[SueldoHora]),
	[idPersona] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 13/03/2018 11:44:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[ApellidoP] [nvarchar](50) NOT NULL,
	[ApellidoS] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [geography] NULL,
 CONSTRAINT [Nombre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 13/03/2018 11:44:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID] [uniqueidentifier] NOT NULL,
	[PrecioBoleto] [money] NOT NULL,
	[BoletosVendidos] [int] NOT NULL,
	[IngresosExternos] [money] NOT NULL,
	[IngresoTotal]  AS ([BoletosVendidos]*[PrecioBoleto]+[IngresosExternos]),
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [ApellidoP]    Script Date: 13/03/2018 11:44:32 a. m. ******/
CREATE NONCLUSTERED INDEX [ApellidoP] ON [dbo].[Persona]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ApellidoS]    Script Date: 13/03/2018 11:44:32 a. m. ******/
CREATE NONCLUSTERED INDEX [ApellidoS] ON [dbo].[Persona]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PracticasLBD] SET  READ_WRITE 
GO
