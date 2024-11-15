USE [master]
GO
/****** Object:  Database [Airport]    Script Date: 10/11/2024 16:05:33 ******/
CREATE DATABASE [Airport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Airport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Airport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Airport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Airport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Airport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Airport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Airport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Airport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Airport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Airport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Airport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Airport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Airport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Airport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Airport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Airport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Airport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Airport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Airport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Airport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Airport] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Airport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Airport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Airport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Airport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Airport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Airport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Airport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Airport] SET RECOVERY FULL 
GO
ALTER DATABASE [Airport] SET  MULTI_USER 
GO
ALTER DATABASE [Airport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Airport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Airport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Airport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Airport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Airport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Airport', N'ON'
GO
ALTER DATABASE [Airport] SET QUERY_STORE = OFF
GO
USE [Airport]
GO
/****** Object:  User [jenn]    Script Date: 10/11/2024 16:05:34 ******/
CREATE USER [jenn] FOR LOGIN [jenn] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[airline_id] [int] NULL,
	[registration_number] [varchar](50) NULL,
	[model_id] [int] NULL,
	[status] [varchar](50) NULL,
	[begin_of_operation] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[city_id] [int] NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport_Airline]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport_Airline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[airline_id] [int] NULL,
	[airport_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvailableSeat]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableSeat](
	[flight_id] [int] NOT NULL,
	[seat_id] [int] NOT NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC,
	[seat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoardingPass]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardingPass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boarding_time] [datetime] NULL,
	[gate] [varchar](50) NULL,
	[flight_id] [int] NULL,
	[seat_id] [int] NULL,
	[passenger_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancellation]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancellation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cancellation_date] [datetime] NULL,
	[cancellation_reason] [varchar](255) NULL,
	[reservation_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryCustomer]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryCustomer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[benefits] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySeat]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorySeat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckIn]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baggage_registered] [bit] NULL,
	[boarding_pass_id] [int] NULL,
	[checkin_time] [datetime] NULL,
	[flight_id] [int] NULL,
	[passenger_id] [int] NULL,
	[status] [varchar](50) NULL,
	[checkin_counter] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class] [varchar](50) NULL,
	[date_of_redemption] [date] NULL,
	[meal_code] [varchar](50) NULL,
	[seat] [int] NULL,
	[standby] [bit] NULL,
	[ticket_id] [int] NULL,
	[flight_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crew]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crew](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewFlight]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewFlight](
	[flight_id] [int] NOT NULL,
	[crew_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC,
	[crew_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewMember]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewMember](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[nationality] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewMemberAssignment]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewMemberAssignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[crew_id] [int] NULL,
	[crew_member_id] [int] NULL,
	[role_id] [int] NULL,
	[segment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewMemberRole]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewMemberRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[nationality] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [int] NULL,
	[category_customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_of_document_id] [int] NULL,
	[number] [varchar](50) NULL,
	[expiration_date] [date] NULL,
	[passenger_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [decimal](10, 2) NULL,
	[date] [date] NULL,
	[type_of_fine_id] [int] NULL,
	[payment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boarding_time] [datetime] NULL,
	[checkin_counter] [varchar](50) NULL,
	[flight_date] [date] NULL,
	[gate] [varchar](50) NULL,
	[duration] [time](7) NULL,
	[flight_number_id] [int] NULL,
	[available_seats] [int] NULL,
	[flight_status] [varchar](50) NULL,
	[airline_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightNumber]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightNumber](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plane_model_id] [int] NULL,
	[departure_time] [datetime] NULL,
	[arrival_time] [datetime] NULL,
	[description] [varchar](255) NULL,
	[start_airport_id] [int] NULL,
	[goal_airport_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FrequentFlyerCard]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrequentFlyerCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ffc_number] [varchar](50) NULL,
	[meal_code] [varchar](50) NULL,
	[miles_accumulated] [int] NULL,
	[passenger_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MethodOfPayment]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MethodOfPayment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[nationality] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[gender] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [decimal](10, 2) NULL,
	[payment_date] [date] NULL,
	[method_of_payment_id] [int] NULL,
	[reservation_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypeCard]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypeCard](
	[id] [int] NOT NULL,
	[card_number] [varchar](16) NULL,
	[expiration_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypeCash]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypeCash](
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypeTransfer]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypeTransfer](
	[id] [int] NOT NULL,
	[account_number] [varchar](20) NULL,
	[bank_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PiecesOfLuggage]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PiecesOfLuggage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NULL,
	[weight] [float] NULL,
	[coupon_id] [int] NULL,
	[check_in_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaneModel]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaneModel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[capacity] [int] NULL,
	[graphic] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reservation_code] [varchar](50) NULL,
	[ticket_quantity] [int] NULL,
	[price] [float] NULL,
	[reservation_status] [varchar](50) NULL,
	[customer_id] [int] NULL,
	[method_of_payment_id] [int] NULL,
	[reservation_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[reservation_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationDetail]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reservation_id] [int] NULL,
	[flight_id] [int] NULL,
	[seat_id] [int] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location] [varchar](50) NULL,
	[number] [varchar](50) NULL,
	[size] [varchar](50) NULL,
	[model_id] [int] NULL,
	[category_seat_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Segment]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Segment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[flight_number_id] [int] NULL,
	[arrival_time] [datetime] NULL,
	[departure_time] [datetime] NULL,
	[start_airport_id] [int] NULL,
	[goal_airport_id] [int] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stopover]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stopover](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[flight_id] [int] NULL,
	[arrival_time] [datetime] NULL,
	[departure_time] [datetime] NULL,
	[layover_duration] [datetime] NULL,
	[segment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NULL,
	[ticket_code] [varchar](50) NULL,
	[passenger_id] [int] NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCategory]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfDocument]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfDocument](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfFine]    Script Date: 10/11/2024 16:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfFine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airplane]  WITH NOCHECK ADD FOREIGN KEY([airline_id])
REFERENCES [dbo].[Airline] ([id])
GO
ALTER TABLE [dbo].[Airplane]  WITH NOCHECK ADD FOREIGN KEY([model_id])
REFERENCES [dbo].[PlaneModel] ([id])
GO
ALTER TABLE [dbo].[Airport]  WITH NOCHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Airport]  WITH NOCHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Airport_Airline]  WITH NOCHECK ADD FOREIGN KEY([airline_id])
REFERENCES [dbo].[Airline] ([id])
GO
ALTER TABLE [dbo].[Airport_Airline]  WITH NOCHECK ADD FOREIGN KEY([airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH NOCHECK ADD FOREIGN KEY([seat_id])
REFERENCES [dbo].[Seat] ([id])
GO
ALTER TABLE [dbo].[BoardingPass]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[BoardingPass]  WITH NOCHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([id])
GO
ALTER TABLE [dbo].[BoardingPass]  WITH NOCHECK ADD FOREIGN KEY([seat_id])
REFERENCES [dbo].[Seat] ([id])
GO
ALTER TABLE [dbo].[Cancellation]  WITH NOCHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[CheckIn]  WITH NOCHECK ADD FOREIGN KEY([boarding_pass_id])
REFERENCES [dbo].[BoardingPass] ([id])
GO
ALTER TABLE [dbo].[CheckIn]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CheckIn]  WITH NOCHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([id])
GO
ALTER TABLE [dbo].[Coupon]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[Coupon]  WITH NOCHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[CrewFlight]  WITH NOCHECK ADD FOREIGN KEY([crew_id])
REFERENCES [dbo].[Crew] ([id])
GO
ALTER TABLE [dbo].[CrewFlight]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CrewMemberAssignment]  WITH NOCHECK ADD FOREIGN KEY([crew_id])
REFERENCES [dbo].[Crew] ([id])
GO
ALTER TABLE [dbo].[CrewMemberAssignment]  WITH NOCHECK ADD FOREIGN KEY([crew_member_id])
REFERENCES [dbo].[CrewMember] ([id])
GO
ALTER TABLE [dbo].[CrewMemberAssignment]  WITH NOCHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[CrewMemberRole] ([id])
GO
ALTER TABLE [dbo].[CrewMemberAssignment]  WITH NOCHECK ADD FOREIGN KEY([segment_id])
REFERENCES [dbo].[Segment] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD FOREIGN KEY([category_customer_id])
REFERENCES [dbo].[CategoryCustomer] ([id])
GO
ALTER TABLE [dbo].[Document]  WITH NOCHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([id])
GO
ALTER TABLE [dbo].[Document]  WITH NOCHECK ADD FOREIGN KEY([type_of_document_id])
REFERENCES [dbo].[TypeOfDocument] ([id])
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([id])
GO
ALTER TABLE [dbo].[Fine]  WITH NOCHECK ADD FOREIGN KEY([type_of_fine_id])
REFERENCES [dbo].[TypeOfFine] ([id])
GO
ALTER TABLE [dbo].[Flight]  WITH NOCHECK ADD FOREIGN KEY([airline_id])
REFERENCES [dbo].[Airline] ([id])
GO
ALTER TABLE [dbo].[Flight]  WITH NOCHECK ADD FOREIGN KEY([flight_number_id])
REFERENCES [dbo].[FlightNumber] ([id])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH NOCHECK ADD FOREIGN KEY([goal_airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH NOCHECK ADD FOREIGN KEY([plane_model_id])
REFERENCES [dbo].[PlaneModel] ([id])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH NOCHECK ADD FOREIGN KEY([start_airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[FrequentFlyerCard]  WITH NOCHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH NOCHECK ADD FOREIGN KEY([method_of_payment_id])
REFERENCES [dbo].[MethodOfPayment] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH NOCHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[PaymentTypeCard]  WITH NOCHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[MethodOfPayment] ([id])
GO
ALTER TABLE [dbo].[PaymentTypeCash]  WITH NOCHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[MethodOfPayment] ([id])
GO
ALTER TABLE [dbo].[PaymentTypeTransfer]  WITH NOCHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[MethodOfPayment] ([id])
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH NOCHECK ADD FOREIGN KEY([check_in_id])
REFERENCES [dbo].[CheckIn] ([id])
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH NOCHECK ADD FOREIGN KEY([coupon_id])
REFERENCES [dbo].[Coupon] ([id])
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD FOREIGN KEY([method_of_payment_id])
REFERENCES [dbo].[MethodOfPayment] ([id])
GO
ALTER TABLE [dbo].[ReservationDetail]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[ReservationDetail]  WITH NOCHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[ReservationDetail]  WITH NOCHECK ADD FOREIGN KEY([seat_id])
REFERENCES [dbo].[Seat] ([id])
GO
ALTER TABLE [dbo].[Seat]  WITH NOCHECK ADD FOREIGN KEY([category_seat_id])
REFERENCES [dbo].[CategorySeat] ([id])
GO
ALTER TABLE [dbo].[Seat]  WITH NOCHECK ADD FOREIGN KEY([model_id])
REFERENCES [dbo].[PlaneModel] ([id])
GO
ALTER TABLE [dbo].[Segment]  WITH NOCHECK ADD FOREIGN KEY([flight_number_id])
REFERENCES [dbo].[FlightNumber] ([id])
GO
ALTER TABLE [dbo].[Segment]  WITH NOCHECK ADD FOREIGN KEY([goal_airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[Segment]  WITH NOCHECK ADD FOREIGN KEY([start_airport_id])
REFERENCES [dbo].[Airport] ([id])
GO
ALTER TABLE [dbo].[Stopover]  WITH NOCHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[Stopover]  WITH NOCHECK ADD FOREIGN KEY([segment_id])
REFERENCES [dbo].[Segment] ([id])
GO
ALTER TABLE [dbo].[Ticket]  WITH NOCHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[TicketCategory] ([id])
GO
ALTER TABLE [dbo].[Ticket]  WITH NOCHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([id])
GO
USE [master]
GO
ALTER DATABASE [Airport] SET  READ_WRITE 
GO
