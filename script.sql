USE [Practica2]
GO
/****** Object:  Table [dbo].[Camiones]    Script Date: 02/03/2018 11:27:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camiones](
	[ID] [uniqueidentifier] NOT NULL,
	[NoCamion] [int] NOT NULL,
	[CantidadAsientos] [int] NOT NULL,
	[FechaIngreso] [date] NULL,
	[Revision] [text] NULL,
 CONSTRAINT [PK_Camiones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 02/03/2018 11:28:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Nombres] [nvarchar](50) NOT NULL,
	[Apeidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Edad] [int] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Ocupacion] [text] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 02/03/2018 11:29:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[DestinoOrigen] [geography] NOT NULL,
	[DestinoFinal] [geography] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[FechaSalida] [datetime] NULL,
	[FechaLlegada] [datetime] NULL,
	[NombreEmpleado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 02/03/2018 11:29:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[ID] [uniqueidentifier] NOT NULL,
	[Empleado] [nvarchar](50) NOT NULL,
	[Puesto] [ntext] NOT NULL,
	[HorasTrabajadas] [float] NOT NULL,
	[SueldoHora] [float] NOT NULL,
	[Descansos] [datetime] NULL,
	[Sueldo]  AS ([HorasTrabajadas]*[SueldoHora]),
 CONSTRAINT [indx_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 02/03/2018 11:29:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID] [uniqueidentifier] NOT NULL,
	[PrecioBoleto] [money] NOT NULL,
	[BoletosVendidos] [int] NOT NULL,
	[FechaBoleto] [date] NULL,
	[NombreVendedor] [nvarchar](50) NOT NULL,
	[NombreCliente] [nvarchar](50) NULL,
	[Ingresos]  AS ([PrecioBoleto]*[BoletosVendidos]),
 CONSTRAINT [index_ingresos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
