/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Oddities]') AND type in (N'U'))
ALTER TABLE [dbo].[Oddities] DROP CONSTRAINT IF EXISTS [FK_Oddities_Origins]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Oddities]') AND type in (N'U'))
ALTER TABLE [dbo].[Oddities] DROP CONSTRAINT IF EXISTS [FK_Oddities_OddityStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Oddities]') AND type in (N'U'))
ALTER TABLE [dbo].[Oddities] DROP CONSTRAINT IF EXISTS [FK_Oddities_Genres]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[Origins]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Origins]
GO
/****** Object:  Table [dbo].[OddityStatus]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[OddityStatus]
GO
/****** Object:  Table [dbo].[Oddities]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Oddities]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Genres]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [StoreFront]    Script Date: 12/11/2020 2:36:44 PM ******/
DROP DATABASE IF EXISTS [StoreFront]
GO
/****** Object:  Database [StoreFront]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'StoreFront')
BEGIN
CREATE DATABASE [StoreFront]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreFront', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreFront_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [StoreFront] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreFront].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreFront] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreFront] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreFront] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreFront] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreFront] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreFront] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreFront] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreFront] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreFront] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreFront] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreFront] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreFront] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreFront] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreFront] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreFront] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreFront] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreFront] SET  MULTI_USER 
GO
ALTER DATABASE [StoreFront] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreFront] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreFront] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreFront] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreFront] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreFront] SET QUERY_STORE = OFF
GO
USE [StoreFront]
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[Phone] [nvarchar](25) NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NULL,
	[Country] [varchar](20) NOT NULL,
	[DirectReportID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Oddities]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Oddities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Oddities](
	[OddityID] [int] IDENTITY(1,1) NOT NULL,
	[OddityName] [varchar](25) NOT NULL,
	[OriginID] [int] NOT NULL,
	[RecoveryDate] [date] NULL,
	[Price] [money] NOT NULL,
	[OddityStatusID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
	[UnitsSold] [int] NOT NULL,
 CONSTRAINT [PK_Oddities] PRIMARY KEY CLUSTERED 
(
	[OddityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OddityStatus]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OddityStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OddityStatus](
	[OddityStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_OddityStatus] PRIMARY KEY CLUSTERED 
(
	[OddityStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Origins]    Script Date: 12/11/2020 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Origins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Origins](
	[OriginID] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Origins] PRIMARY KEY CLUSTERED 
(
	[OriginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011101946323_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F20FF20E869B3705ABE6406B3463B81D3B6778D8C2F98F60CF66DC096D86D61244A9128C7C6225FB60FFB49FB0B5B94A80B6FBA74CBDDED2040E016C953C5E221592C16E77FFFF9EFF4E7E730B09E7092FA1139B38F2687B685891B793E599DD9195DFEF0C1FEF9A7EFFE32BDF4C267EB4B59EF84D58396243DB31F298D4F1D27751F7188D249E8BB4994464B3A71A3D0415EE41C1F1EFEDD393A723040D8806559D34F19A17E88F31FF073161117C73443C14DE4E120E5DFA1649EA35AB728C4698C5C7C665F7B18DAD297390AE3004F8A06B6751EF8089499E360695B889088220AAA9E7E4EF19C261159CD63F8808287971843BD250A52CCBB705A57EFDB9BC363D61BA76E5842B9594AA37020E0D109378F23375FCBC876653E30E0656E2CD6EBDC88B5FD3E4501184016783A0B1256F9CCBEA9449CA7F12DA693B2E1A480BC4A00EEF728F93669221E58BDDB1D54743A9E1CB2FF0EAC5916D02CC16704673441C181759F2D02DFFD15BF3C44DF30393B395A2C4F3EBC7B8FBC93F73FE29377CD9E425FA19EF0013EDD27518C13D00D2FABFEDB9623B673E48655B3469BC22AC0259819B675839E3F62B2A28F30678E3FD8D695FF8CBDF20B27D767E2C344824634C9E0E76D16046811E0AADC6995C9FEDF22F5F8DDFB51A4DEA2277F950FBD241F264E02F3EA130EF2D2F4D18F8BE9258CF7575EED2A8942F65BE45751FA751E6589CB3A1319AB3CA06485A9A8DDD4A9C9DB8BD20C6A7C5A97A8FB4F6DA6A94A6F6D55D6A17566422962DBB3A1D4F775E5F666DC791CC3E0E5D4621669239C76BF9A480007D69C4609865944E897E39A3E477DE943A05B7FE6D5F032447E30C272D8430A38234B3F0971D5CB5F22201F228375BE47690AAB81F74F943EB6A80E7F8EA0FA1CBB59C268468167AF2EEDFE3122F8360B178CFBDB9335DAD03CFC1E5D2117A6DC2561AD36C6FB18B9DFA28C5E12EF0251FC99BA2520FBF9E087FD014651E7DC75719A5E0199B1378BC0D72E01AF093D391E0CC756A85DBB23B300F9A1DE1F91D6D2AF65D5DA27D1D750FC1243359D6FD2A6EAC768E5937EAA9655CDAA16353A55E5D586AACAC0FA69CA6B9A15CD2B74EA59D41ACDDBCB47687C772F87DD7F7F6FB3CDDBB41634CC983B25FFC00427B08C79F788529C907A04FAAC1BBB7016F2E163425F7D6FCA257D414136B6A8B56643BE088C3F1B72D8FD9F0DB99AF0F9C9F79857D2E310545606F85EF5F5E7ABEE392769B6EDE9207473DBC2B7B30698A6CB799A46AE9FCF024DF88B072F44FDC187B3BA2319456FE46808740C88EEB32D0FBE40DF6C995477E402079862EBDC2DC2833394BAC853CD081DF2062856EEA81AC5EAA888A8DCDF1499C0749CB046881D825298A93EA1EAB4F089EBC728E8B492D4B2E716C6FA5EC9904B2E708C0913D869893EC2F54110A64025471A942E0B4D9D06E3DA8968F05A4D63DEE5C2D6E3AEC426B6C2C90EDFD9C04BEEBFBD0A31DB2DB60572B69BA48F02C680DE2E08CACF2A7D09201F5CF68DA0D289C94050EE526D85A0A2C5764050D1246F8EA0C511B5EFF84BE7D57DA3A77850DEFEB6DE6AAE1D7053B0C79E51B3F03DA10D85163851E979B16085F8996A0E67A0273F9FA5DCD5952992DF1E602A866C6A7F57EB873AED203289DA006BA27580F2AB400548995003942B6379ADDA712F62006C19776B85E56BBF04DBE0808ADDBC126D54345F9CCAE4EC75FAA87A56B1412179AFC3420347430879F1123BDEC328A6B8AC6A983EBEF0106FB8D1313E182D06EAF05C0D462A3B33BA954A6A765B49E7900D71C936B292E43E19AC547666742B718E761B49E3140C700B363291B8858F34D9CA4847B5DB546553A74896E21FA68E21AB6A7A83E2D827AB469615FF62CD8B14ABD90FF3E189476181E1B8A926FFA8D2B69244A304ADB0540AA241D32B3F49E905A26881589C67E6854A35EDDE6A58FE4B91CDED531DC4721F286BB3BFC5B55DBCC017B65BD51FE13057D0C990393579245D43017D738B25BEA100259AE0FD2C0AB290987D2C73EBE20AAFD9BEF8A2224C1D497FC587520CA678BAA2F57B8D8D3A2FC61BA7CA8B597FACCC10268B973E68D3E626BFD48C5286A99A28A6D0D5CEC6CEE4CE0C1D2FD9591C3E5C9D08AF33BB78864A13807F1A88D1487250C01A65FD51C53C9426A658D21F514A3669424A4503B46CA694084A360BD6C23358545FA3BF043589A489AE96F647D6A49334A135C56B606B7496CBFAA36A324E9AC09AE2FED875FA89BC8EEEF1FE653CC26CB2811507DDCD763003C6EB2C8AE36C808DFBFC2650E3F3402C7E63AF80F1EF7B4928E3696F134215218ECD0865C030AF3FC265B8B8FCB4DEE09B31851B6E61896FBBE137E30DA3EDAB924339EFC9552AE9D5B94F3ADF4DF959ABFB698D72F82AAAD8566946D8DE5F528AC309AB3099FF16CC021FB3C5BCAC708388BFC4292DB23AECE3C3A363E969CEFE3C9371D2D40B346755D35B1971CCB690A0459E50E23EA2444D97D8E029490DAA44A2AF89879FCFEC7FE7AD4EF3A006FB2BFF7C605DA79F89FF5B06050F4986AD3FD4F4CF7152EB7B3CE6A814FDE34DBC92E86FF2EB7F7D2D9A1E5877094CA753EB5032F43AC32FBE9D18A44DD174036DD67E51F176679BF054418B2ACD96F55F262C7C3ACAAB8452CBBF86E8F9FBA1AA695F1E6C84A8795D3016DE282634BD1E5807CBF872C0839F347F3930ACB3FA9704EBA8667C45E093E160F21B82FECB50D97287FB90E6CCB48D2529B773670EF6460999BBDE9B9454ED8D26BA9A8E3D006ED494EBCD5C943796CA3CDAD6A9C9541E0D7B97BC7FF5F4E47DC948AE9DF6DD26226F33F7B8E566E94F9572BC0749729AA49FDD27166F9B6BA620F09E67670E4B1FDE33B2F16D7EF749C2DB269B2940BCE7641B940ABC675CDBD5FEB963A6F5DE42779ED8ABE628192E737451E4AEC4DD22E40EC7FF450424283CCAE2BDA53E53CC24AC268B51605DC52CD49CA2260B56268E2257A9D12E76585FF986DFDA595EA75DAC21B1B34D365FFF5B65F33AEDB20DE992BB4839D6262CEAD2C03BD6B1B63CAAB794622CF4A423A3BDCB676DBD997F4B19C5A31845983D86DBE5B793403C8A49C69C3A031286D58B62D83B1BFF5223ECDFA9BFAA21D8BFDB48B02BEC9A559D6BB28CCACD5BD2A8AC2245686E30451E6CA9E709F597C8A550CC02D0F983F13CA8C7AE4116D8BB2677198D330A5DC6E12210025ECC0968939F67458B3A4FEF62F62B1DA30BA0A6CF02F777E497CC0FBC4AEF2B4D4CC800C1BC0B1EEE65634959D877F55221DD46A42710375FE5143DE0300E002CBD2373F484D7D10DE8F711AF90FB5247004D20DD03219A7D7AE1A35582C29463D4EDE12770D80B9F7FFA3F3DFA3F9CB0540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'811c7924-7bee-4788-80e2-817c29641b77', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b191d345-6feb-49b4-8a6a-e98336e1348c', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'597a9d33-0c1b-4572-8445-55416a4a9ae9', N'811c7924-7bee-4788-80e2-817c29641b77')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'597a9d33-0c1b-4572-8445-55416a4a9ae9', N'Admin@storefront.com', 0, N'AA9cngdn4rHVLEIWfMv1aAJzoB3+KQM0ygQEW5BnLW/qPxXW34tP/ZIttntiASyp0g==', N'ca6585ea-75e6-47cd-8d93-04c3d4b41f85', NULL, 0, 0, NULL, 1, 0, N'Admin@storefront.com')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (1, N'StoreFront')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (2, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (3, N'Recovery')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (4, N'Manager')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [HireDate], [Phone], [City], [State], [Country], [DirectReportID]) VALUES (3, N'Daniel', N'NottaWitch', 1, CAST(N'2005-09-21' AS Date), N'555-555-5555', N'San Diego', N'CA', N'USA', 5)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [HireDate], [Phone], [City], [State], [Country], [DirectReportID]) VALUES (4, N'Lisa', N'Maybespooky', 1, CAST(N'2011-04-12' AS Date), N'555-554-5555', N'New York', N'NY', N'USA', 5)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [HireDate], [Phone], [City], [State], [Country], [DirectReportID]) VALUES (5, N'Patrick', N'Star-Norelation', 3, CAST(N'2015-07-29' AS Date), N'555-553-5555', N'London', NULL, N'UK', 6)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [HireDate], [Phone], [City], [State], [Country], [DirectReportID]) VALUES (6, N'Mandy', N'FromGrimAdventures', 2, CAST(N'2019-10-31' AS Date), N'555-552-5555', N'Kansas City', N'KS', N'USA', 7)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [DepartmentID], [HireDate], [Phone], [City], [State], [Country], [DirectReportID]) VALUES (7, N'Maggie', N'Boo', 4, CAST(N'2002-12-25' AS Date), N'555-551-5555', N'Seattle', N'WA', N'USA', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [Genre]) VALUES (1, N'DIY')
INSERT [dbo].[Genres] ([GenreID], [Genre]) VALUES (2, N'Pet')
INSERT [dbo].[Genres] ([GenreID], [Genre]) VALUES (3, N'Magic')
INSERT [dbo].[Genres] ([GenreID], [Genre]) VALUES (4, N'Weapon')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Oddities] ON 

INSERT [dbo].[Oddities] ([OddityID], [OddityName], [OriginID], [RecoveryDate], [Price], [OddityStatusID], [GenreID], [UnitsSold]) VALUES (1, N'Dragon Cat', 2, CAST(N'1912-08-21' AS Date), 499.9900, 2, 2, 542)
INSERT [dbo].[Oddities] ([OddityID], [OddityName], [OriginID], [RecoveryDate], [Price], [OddityStatusID], [GenreID], [UnitsSold]) VALUES (2, N'Self-Eating Snail', 1, CAST(N'1956-07-08' AS Date), 119.9900, 1, 2, 79576)
INSERT [dbo].[Oddities] ([OddityID], [OddityName], [OriginID], [RecoveryDate], [Price], [OddityStatusID], [GenreID], [UnitsSold]) VALUES (3, N'Book of Magic', 5, CAST(N'1212-12-12' AS Date), 87.9900, 2, 3, 12)
INSERT [dbo].[Oddities] ([OddityID], [OddityName], [OriginID], [RecoveryDate], [Price], [OddityStatusID], [GenreID], [UnitsSold]) VALUES (4, N'World in a Box', 4, CAST(N'1999-01-17' AS Date), 999.9900, 1, 1, 3)
INSERT [dbo].[Oddities] ([OddityID], [OddityName], [OriginID], [RecoveryDate], [Price], [OddityStatusID], [GenreID], [UnitsSold]) VALUES (5, N'Voodoo Torture Dolls', 3, CAST(N'1763-04-30' AS Date), 44.9900, 3, 3, 76842)
SET IDENTITY_INSERT [dbo].[Oddities] OFF
SET IDENTITY_INSERT [dbo].[OddityStatus] ON 

INSERT [dbo].[OddityStatus] ([OddityStatusID], [Status]) VALUES (1, N'In-Stock')
INSERT [dbo].[OddityStatus] ([OddityStatusID], [Status]) VALUES (2, N'Out-of-Stock')
INSERT [dbo].[OddityStatus] ([OddityStatusID], [Status]) VALUES (3, N'On-Backorder')
SET IDENTITY_INSERT [dbo].[OddityStatus] OFF
SET IDENTITY_INSERT [dbo].[Origins] ON 

INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (1, N'Brazil')
INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (2, N'China')
INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (3, N'Bosnia')
INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (4, N'Djibouti')
INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (5, N'Greenland')
INSERT [dbo].[Origins] ([OriginID], [Origin]) VALUES (6, N'United Kingdom')
SET IDENTITY_INSERT [dbo].[Origins] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/11/2020 2:36:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities]  WITH CHECK ADD  CONSTRAINT [FK_Oddities_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities] CHECK CONSTRAINT [FK_Oddities_Genres]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_OddityStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities]  WITH CHECK ADD  CONSTRAINT [FK_Oddities_OddityStatus] FOREIGN KEY([OddityStatusID])
REFERENCES [dbo].[OddityStatus] ([OddityStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_OddityStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities] CHECK CONSTRAINT [FK_Oddities_OddityStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_Origins]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities]  WITH CHECK ADD  CONSTRAINT [FK_Oddities_Origins] FOREIGN KEY([OddityID])
REFERENCES [dbo].[Origins] ([OriginID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Oddities_Origins]') AND parent_object_id = OBJECT_ID(N'[dbo].[Oddities]'))
ALTER TABLE [dbo].[Oddities] CHECK CONSTRAINT [FK_Oddities_Origins]
GO
ALTER DATABASE [StoreFront] SET  READ_WRITE 
GO
