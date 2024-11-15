USE [master]
GO
/****** Object:  Database [AirportDM]    Script Date: 10/11/2024 16:04:31 ******/
CREATE DATABASE [AirportDM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirportDM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirportDM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirportDM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirportDM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirportDM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirportDM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirportDM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirportDM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirportDM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirportDM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirportDM] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirportDM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirportDM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirportDM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirportDM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirportDM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirportDM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirportDM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirportDM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirportDM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirportDM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AirportDM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirportDM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirportDM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirportDM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirportDM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirportDM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirportDM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirportDM] SET RECOVERY FULL 
GO
ALTER DATABASE [AirportDM] SET  MULTI_USER 
GO
ALTER DATABASE [AirportDM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirportDM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirportDM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirportDM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirportDM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirportDM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirportDM', N'ON'
GO
ALTER DATABASE [AirportDM] SET QUERY_STORE = OFF
GO
USE [AirportDM]
GO
/****** Object:  User [jenn]    Script Date: 10/11/2024 16:04:31 ******/
CREATE USER [jenn] FOR LOGIN [jenn] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DimAerolínea]    Script Date: 10/11/2024 16:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAerolínea](
	[ID_Aerolínea] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Aerolínea] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Aerolínea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAeropuerto]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAeropuerto](
	[ID_Aeropuerto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Aeropuerto] [varchar](255) NULL,
	[Ciudad] [varchar](255) NULL,
	[País] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Aeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAvion]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAvion](
	[ID_Avion] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](255) NULL,
	[Capacidad_Asientos] [int] NULL,
	[Año_inicio_operacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Avion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEscala]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEscala](
	[ID_Escala] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad_Escalas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Escala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEstado]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEstado](
	[ID_Estado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPasajero]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPasajero](
	[ID_Pasajero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Sexo] [varchar](10) NULL,
	[Nacionalidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTiempo]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTiempo](
	[ID_Tiempo] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Año] [int] NULL,
	[Mes] [int] NULL,
	[Dia] [int] NULL,
	[NombreMes] [varchar](50) NULL,
	[NombreDia] [varchar](50) NULL,
	[Trimestre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVuelo]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVuelo](
	[ID_Vuelo] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Vuelo] [varchar](50) NULL,
	[Sin_Escala] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Vuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactAviones]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactAviones](
	[ID_Tiempo] [int] NOT NULL,
	[ID_Aerolínea] [int] NOT NULL,
	[ID_Estado] [int] NULL,
	[ID_Avion] [int] NOT NULL,
	[Cantidad_Aviones] [int] NULL,
	[Porcentaje_Aviones] [decimal](5, 2) NULL,
	[Promedio_Antigüedad] [decimal](5, 2) NULL,
	[Promedio_Horas_Vuelo] [decimal](5, 2) NULL,
	[Promedio_Asientos] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tiempo] ASC,
	[ID_Aerolínea] ASC,
	[ID_Avion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEquipaje]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEquipaje](
	[ID_Tiempo] [int] NOT NULL,
	[ID_Pasajero] [int] NOT NULL,
	[ID_Vuelo] [int] NOT NULL,
	[Peso_Promedio] [decimal](5, 2) NULL,
	[Cantidad_Equipajes] [int] NULL,
	[Porcentaje_Equipajes] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tiempo] ASC,
	[ID_Pasajero] ASC,
	[ID_Vuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactVuelos]    Script Date: 10/11/2024 16:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactVuelos](
	[ID_Tiempo] [int] NOT NULL,
	[ID_Aerolínea] [int] NOT NULL,
	[ID_Aeropuerto_Origen] [int] NOT NULL,
	[ID_Aeropuerto_Destino] [int] NOT NULL,
	[ID_Escala] [int] NULL,
	[ID_Vuelo] [int] NOT NULL,
	[Cantidad_Vuelos] [int] NULL,
	[Porcentaje_Vuelos] [decimal](5, 2) NULL,
	[Duración_Promedio] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tiempo] ASC,
	[ID_Aerolínea] ASC,
	[ID_Aeropuerto_Origen] ASC,
	[ID_Aeropuerto_Destino] ASC,
	[ID_Vuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactAviones]  WITH NOCHECK ADD FOREIGN KEY([ID_Aerolínea])
REFERENCES [dbo].[DimAerolínea] ([ID_Aerolínea])
GO
ALTER TABLE [dbo].[FactAviones]  WITH NOCHECK ADD FOREIGN KEY([ID_Avion])
REFERENCES [dbo].[DimAvion] ([ID_Avion])
GO
ALTER TABLE [dbo].[FactAviones]  WITH NOCHECK ADD FOREIGN KEY([ID_Estado])
REFERENCES [dbo].[DimEstado] ([ID_Estado])
GO
ALTER TABLE [dbo].[FactAviones]  WITH NOCHECK ADD FOREIGN KEY([ID_Tiempo])
REFERENCES [dbo].[DimTiempo] ([ID_Tiempo])
GO
ALTER TABLE [dbo].[FactEquipaje]  WITH NOCHECK ADD FOREIGN KEY([ID_Pasajero])
REFERENCES [dbo].[DimPasajero] ([ID_Pasajero])
GO
ALTER TABLE [dbo].[FactEquipaje]  WITH NOCHECK ADD FOREIGN KEY([ID_Tiempo])
REFERENCES [dbo].[DimTiempo] ([ID_Tiempo])
GO
ALTER TABLE [dbo].[FactEquipaje]  WITH NOCHECK ADD FOREIGN KEY([ID_Vuelo])
REFERENCES [dbo].[DimVuelo] ([ID_Vuelo])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Aerolínea])
REFERENCES [dbo].[DimAerolínea] ([ID_Aerolínea])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Aeropuerto_Origen])
REFERENCES [dbo].[DimAeropuerto] ([ID_Aeropuerto])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Aeropuerto_Destino])
REFERENCES [dbo].[DimAeropuerto] ([ID_Aeropuerto])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Escala])
REFERENCES [dbo].[DimEscala] ([ID_Escala])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Tiempo])
REFERENCES [dbo].[DimTiempo] ([ID_Tiempo])
GO
ALTER TABLE [dbo].[FactVuelos]  WITH NOCHECK ADD FOREIGN KEY([ID_Vuelo])
REFERENCES [dbo].[DimVuelo] ([ID_Vuelo])
GO
USE [master]
GO
ALTER DATABASE [AirportDM] SET  READ_WRITE 
GO
