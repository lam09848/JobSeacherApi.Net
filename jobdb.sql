USE [master]
GO
/****** Object:  Database [jobdb]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE DATABASE [jobdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jobdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\jobdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jobdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\jobdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [jobdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jobdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jobdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jobdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jobdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jobdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jobdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [jobdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jobdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jobdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jobdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jobdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jobdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jobdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jobdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jobdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jobdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jobdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jobdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jobdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jobdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jobdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jobdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jobdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jobdb] SET RECOVERY FULL 
GO
ALTER DATABASE [jobdb] SET  MULTI_USER 
GO
ALTER DATABASE [jobdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jobdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jobdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jobdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jobdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jobdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'jobdb', N'ON'
GO
ALTER DATABASE [jobdb] SET QUERY_STORE = OFF
GO
USE [jobdb]
GO
/****** Object:  Schema [jobdb]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE SCHEMA [jobdb]
GO
/****** Object:  Table [jobdb].[auth_group]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[auth_group](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_auth_group_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_group$name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[auth_group_permissions]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[auth_group_permissions](
	[id] [bigint] IDENTITY(5,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
 CONSTRAINT [PK_auth_group_permissions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_group_permissions$auth_group_permissions_group_id_permission_id_0cd325b0_uniq] UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[auth_permission]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[auth_permission](
	[id] [int] IDENTITY(85,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_auth_permission_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_permission$auth_permission_content_type_id_codename_01ab375a_uniq] UNIQUE NONCLUSTERED 
(
	[content_type_id] ASC,
	[codename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[authtoken_token]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[authtoken_token](
	[key] [nvarchar](40) NOT NULL,
	[created] [datetime2](6) NOT NULL,
	[user_id] [bigint] NOT NULL,
 CONSTRAINT [PK_authtoken_token_key] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [authtoken_token$user_id] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[django_admin_log]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[django_admin_log](
	[id] [int] IDENTITY(35,1) NOT NULL,
	[action_time] [datetime2](6) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [int] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [bigint] NOT NULL,
 CONSTRAINT [PK_django_admin_log_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[django_content_type]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[django_content_type](
	[id] [int] IDENTITY(22,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_django_content_type_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [django_content_type$django_content_type_app_label_model_76bd3d3b_uniq] UNIQUE NONCLUSTERED 
(
	[app_label] ASC,
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[django_migrations]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[django_migrations](
	[id] [bigint] IDENTITY(34,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_django_migrations_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[django_session]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](6) NOT NULL,
 CONSTRAINT [PK_django_session_session_key] PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_apply]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_apply](
	[id] [bigint] IDENTITY(14,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[post_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[CV] [nvarchar](100) NULL,
 CONSTRAINT [PK_jobs_apply_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_category]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_category](
	[id] [bigint] IDENTITY(15,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_jobs_category_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [jobs_category$name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_comment]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_comment](
	[id] [bigint] IDENTITY(4,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[creator_id] [bigint] NOT NULL,
	[hirer_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jobs_comment_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_major]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_major](
	[id] [bigint] IDENTITY(66,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[category_id] [bigint] NULL,
 CONSTRAINT [PK_jobs_major_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [jobs_major$name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_post]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_post](
	[id] [bigint] IDENTITY(35,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[company] [nvarchar](100) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[from_salary] [float] NULL,
	[to_salary] [float] NULL,
	[gender] [nvarchar](25) NOT NULL,
	[quantity] [int] NULL,
	[type] [nvarchar](50) NOT NULL,
	[time_work] [nvarchar](50) NOT NULL,
	[due] [datetime2](6) NULL,
	[description] [nvarchar](max) NOT NULL,
	[major_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jobs_post_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_rating]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_rating](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[rate] [smallint] NOT NULL,
	[creator_id] [bigint] NOT NULL,
	[hirer_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jobs_rating_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_token]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_token](
	[id] [bigint] IDENTITY(20,1) NOT NULL,
	[token] [nvarchar](256) NULL,
	[user_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jobs_token_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_user]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_user](
	[id] [bigint] IDENTITY(30,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](6) NULL,
	[is_superuser] [smallint] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [smallint] NOT NULL,
	[is_active] [smallint] NOT NULL,
	[date_joined] [datetime2](6) NOT NULL,
	[avatar] [nvarchar](100) NULL,
	[user_role] [int] NOT NULL,
 CONSTRAINT [PK_jobs_user_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [jobs_user$username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_user_groups]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_user_groups](
	[id] [bigint] IDENTITY(2,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_jobs_user_groups_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [jobs_user_groups$jobs_user_groups_user_id_group_id_39db2e61_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_user_user_permissions]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[permission_id] [int] NOT NULL,
 CONSTRAINT [PK_jobs_user_user_permissions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [jobs_user_user_permissions$jobs_user_user_permissions_user_id_permission_id_80875a4d_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[jobs_waiting]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[jobs_waiting](
	[id] [bigint] IDENTITY(19,1) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[updated_date] [datetime2](6) NOT NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [PK_jobs_waiting_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[oauth2_provider_accesstoken]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[oauth2_provider_accesstoken](
	[id] [bigint] IDENTITY(62,1) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[expires] [datetime2](6) NOT NULL,
	[scope] [nvarchar](max) NOT NULL,
	[application_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[created] [datetime2](6) NOT NULL,
	[updated] [datetime2](6) NOT NULL,
	[source_refresh_token_id] [bigint] NULL,
	[id_token_id] [bigint] NULL,
 CONSTRAINT [PK_oauth2_provider_accesstoken_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_accesstoken$id_token_id] UNIQUE NONCLUSTERED 
(
	[id_token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_accesstoken$source_refresh_token_id] UNIQUE NONCLUSTERED 
(
	[source_refresh_token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_accesstoken$token] UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[oauth2_provider_application]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[oauth2_provider_application](
	[id] [bigint] IDENTITY(4,1) NOT NULL,
	[client_id] [nvarchar](100) NOT NULL,
	[redirect_uris] [nvarchar](max) NOT NULL,
	[client_type] [nvarchar](32) NOT NULL,
	[authorization_grant_type] [nvarchar](32) NOT NULL,
	[client_secret] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[user_id] [bigint] NULL,
	[skip_authorization] [smallint] NOT NULL,
	[created] [datetime2](6) NOT NULL,
	[updated] [datetime2](6) NOT NULL,
	[algorithm] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_oauth2_provider_application_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_application$client_id] UNIQUE NONCLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[oauth2_provider_grant]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[oauth2_provider_grant](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[expires] [datetime2](6) NOT NULL,
	[redirect_uri] [nvarchar](max) NOT NULL,
	[scope] [nvarchar](max) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[created] [datetime2](6) NOT NULL,
	[updated] [datetime2](6) NOT NULL,
	[code_challenge] [nvarchar](128) NOT NULL,
	[code_challenge_method] [nvarchar](10) NOT NULL,
	[nonce] [nvarchar](255) NOT NULL,
	[claims] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_oauth2_provider_grant_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_grant$code] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[oauth2_provider_idtoken]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[oauth2_provider_idtoken](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[jti] [nchar](32) NOT NULL,
	[expires] [datetime2](6) NOT NULL,
	[scope] [nvarchar](max) NOT NULL,
	[created] [datetime2](6) NOT NULL,
	[updated] [datetime2](6) NOT NULL,
	[application_id] [bigint] NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [PK_oauth2_provider_idtoken_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_idtoken$jti] UNIQUE NONCLUSTERED 
(
	[jti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [jobdb].[oauth2_provider_refreshtoken]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [jobdb].[oauth2_provider_refreshtoken](
	[id] [bigint] IDENTITY(62,1) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[access_token_id] [bigint] NULL,
	[application_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[created] [datetime2](6) NOT NULL,
	[updated] [datetime2](6) NOT NULL,
	[revoked] [datetime2](6) NULL,
 CONSTRAINT [PK_oauth2_provider_refreshtoken_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_refreshtoken$access_token_id] UNIQUE NONCLUSTERED 
(
	[access_token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq] UNIQUE NONCLUSTERED 
(
	[token] ASC,
	[revoked] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissio_permission_id_84c5c92e_fk_auth_perm]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissio_permission_id_84c5c92e_fk_auth_perm] ON [jobdb].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb_fk_django_co]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb_fk_django_co] ON [jobdb].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6_fk_jobs_user_id] ON [jobdb].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [jobdb].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_apply_post_id_0e6de5aa_fk_jobs_post_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_apply_post_id_0e6de5aa_fk_jobs_post_id] ON [jobdb].[jobs_apply]
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_apply_user_id_727fd922_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_apply_user_id_727fd922_fk_jobs_user_id] ON [jobdb].[jobs_apply]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_comment_creator_id_ae74a745_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_comment_creator_id_ae74a745_fk_jobs_user_id] ON [jobdb].[jobs_comment]
(
	[creator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_comment_hirer_id_fb1213e0_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_comment_hirer_id_fb1213e0_fk_jobs_user_id] ON [jobdb].[jobs_comment]
(
	[hirer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_major_category_id_8204c8fd_fk_jobs_category_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_major_category_id_8204c8fd_fk_jobs_category_id] ON [jobdb].[jobs_major]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_post_major_id_20bd7e32_fk_jobs_major_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_post_major_id_20bd7e32_fk_jobs_major_id] ON [jobdb].[jobs_post]
(
	[major_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_post_user_id_d4bf4781_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_post_user_id_d4bf4781_fk_jobs_user_id] ON [jobdb].[jobs_post]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_rating_creator_id_776f361e_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_rating_creator_id_776f361e_fk_jobs_user_id] ON [jobdb].[jobs_rating]
(
	[creator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_rating_hirer_id_77b212a0_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_rating_hirer_id_77b212a0_fk_jobs_user_id] ON [jobdb].[jobs_rating]
(
	[hirer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_token_user_id_443fe749_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_token_user_id_443fe749_fk_jobs_user_id] ON [jobdb].[jobs_token]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id] ON [jobdb].[jobs_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_user_user_permi_permission_id_e171478b_fk_auth_perm]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_user_user_permi_permission_id_e171478b_fk_auth_perm] ON [jobdb].[jobs_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [jobs_waiting_user_id_0073a616_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [jobs_waiting_user_id_0073a616_fk_jobs_user_id] ON [jobdb].[jobs_waiting]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr] ON [jobdb].[oauth2_provider_accesstoken]
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id] ON [jobdb].[oauth2_provider_accesstoken]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [oauth2_provider_application_client_secret_53133678]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_application_client_secret_53133678] ON [jobdb].[oauth2_provider_application]
(
	[client_secret] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_application_user_id_79829054_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_application_user_id_79829054_fk_jobs_user_id] ON [jobdb].[oauth2_provider_application]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_gran_application_id_81923564_fk_oauth2_pr]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_gran_application_id_81923564_fk_oauth2_pr] ON [jobdb].[oauth2_provider_grant]
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id] ON [jobdb].[oauth2_provider_grant]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr] ON [jobdb].[oauth2_provider_idtoken]
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id] ON [jobdb].[oauth2_provider_idtoken]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr] ON [jobdb].[oauth2_provider_refreshtoken]
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id]    Script Date: 9/2/2022 5:28:50 PM ******/
CREATE NONCLUSTERED INDEX [oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id] ON [jobdb].[oauth2_provider_refreshtoken]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [jobdb].[django_admin_log] ADD  DEFAULT (NULL) FOR [content_type_id]
GO
ALTER TABLE [jobdb].[jobs_apply] ADD  DEFAULT (NULL) FOR [CV]
GO
ALTER TABLE [jobdb].[jobs_major] ADD  DEFAULT (NULL) FOR [category_id]
GO
ALTER TABLE [jobdb].[jobs_post] ADD  DEFAULT (NULL) FOR [from_salary]
GO
ALTER TABLE [jobdb].[jobs_post] ADD  DEFAULT (NULL) FOR [to_salary]
GO
ALTER TABLE [jobdb].[jobs_post] ADD  DEFAULT (NULL) FOR [quantity]
GO
ALTER TABLE [jobdb].[jobs_post] ADD  DEFAULT (NULL) FOR [due]
GO
ALTER TABLE [jobdb].[jobs_token] ADD  DEFAULT (NULL) FOR [token]
GO
ALTER TABLE [jobdb].[jobs_user] ADD  DEFAULT (NULL) FOR [last_login]
GO
ALTER TABLE [jobdb].[jobs_user] ADD  DEFAULT (NULL) FOR [avatar]
GO
ALTER TABLE [jobdb].[jobs_waiting] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] ADD  DEFAULT (NULL) FOR [application_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] ADD  DEFAULT (NULL) FOR [source_refresh_token_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] ADD  DEFAULT (NULL) FOR [id_token_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_application] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_grant] ADD  DEFAULT (N'') FOR [claims]
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken] ADD  DEFAULT (NULL) FOR [application_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken] ADD  DEFAULT (NULL) FOR [access_token_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken] ADD  DEFAULT (NULL) FOR [revoked]
GO
ALTER TABLE [jobdb].[auth_group_permissions]  WITH NOCHECK ADD  CONSTRAINT [auth_group_permissions$auth_group_permissio_permission_id_84c5c92e_fk_auth_perm] FOREIGN KEY([permission_id])
REFERENCES [jobdb].[auth_permission] ([id])
GO
ALTER TABLE [jobdb].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions$auth_group_permissio_permission_id_84c5c92e_fk_auth_perm]
GO
ALTER TABLE [jobdb].[auth_group_permissions]  WITH NOCHECK ADD  CONSTRAINT [auth_group_permissions$auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [jobdb].[auth_group] ([id])
GO
ALTER TABLE [jobdb].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions$auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [jobdb].[auth_permission]  WITH NOCHECK ADD  CONSTRAINT [auth_permission$auth_permission_content_type_id_2f476e4b_fk_django_co] FOREIGN KEY([content_type_id])
REFERENCES [jobdb].[django_content_type] ([id])
GO
ALTER TABLE [jobdb].[auth_permission] CHECK CONSTRAINT [auth_permission$auth_permission_content_type_id_2f476e4b_fk_django_co]
GO
ALTER TABLE [jobdb].[authtoken_token]  WITH NOCHECK ADD  CONSTRAINT [authtoken_token$authtoken_token_user_id_35299eff_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[authtoken_token] CHECK CONSTRAINT [authtoken_token$authtoken_token_user_id_35299eff_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[django_admin_log]  WITH NOCHECK ADD  CONSTRAINT [django_admin_log$django_admin_log_content_type_id_c4bce8eb_fk_django_co] FOREIGN KEY([content_type_id])
REFERENCES [jobdb].[django_content_type] ([id])
GO
ALTER TABLE [jobdb].[django_admin_log] CHECK CONSTRAINT [django_admin_log$django_admin_log_content_type_id_c4bce8eb_fk_django_co]
GO
ALTER TABLE [jobdb].[django_admin_log]  WITH NOCHECK ADD  CONSTRAINT [django_admin_log$django_admin_log_user_id_c564eba6_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[django_admin_log] CHECK CONSTRAINT [django_admin_log$django_admin_log_user_id_c564eba6_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_apply]  WITH NOCHECK ADD  CONSTRAINT [jobs_apply$jobs_apply_post_id_0e6de5aa_fk_jobs_post_id] FOREIGN KEY([post_id])
REFERENCES [jobdb].[jobs_post] ([id])
GO
ALTER TABLE [jobdb].[jobs_apply] CHECK CONSTRAINT [jobs_apply$jobs_apply_post_id_0e6de5aa_fk_jobs_post_id]
GO
ALTER TABLE [jobdb].[jobs_apply]  WITH NOCHECK ADD  CONSTRAINT [jobs_apply$jobs_apply_user_id_727fd922_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_apply] CHECK CONSTRAINT [jobs_apply$jobs_apply_user_id_727fd922_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_comment]  WITH NOCHECK ADD  CONSTRAINT [jobs_comment$jobs_comment_creator_id_ae74a745_fk_jobs_user_id] FOREIGN KEY([creator_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_comment] CHECK CONSTRAINT [jobs_comment$jobs_comment_creator_id_ae74a745_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_comment]  WITH NOCHECK ADD  CONSTRAINT [jobs_comment$jobs_comment_hirer_id_fb1213e0_fk_jobs_user_id] FOREIGN KEY([hirer_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_comment] CHECK CONSTRAINT [jobs_comment$jobs_comment_hirer_id_fb1213e0_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_major]  WITH NOCHECK ADD  CONSTRAINT [jobs_major$jobs_major_category_id_8204c8fd_fk_jobs_category_id] FOREIGN KEY([category_id])
REFERENCES [jobdb].[jobs_category] ([id])
GO
ALTER TABLE [jobdb].[jobs_major] CHECK CONSTRAINT [jobs_major$jobs_major_category_id_8204c8fd_fk_jobs_category_id]
GO
ALTER TABLE [jobdb].[jobs_post]  WITH NOCHECK ADD  CONSTRAINT [jobs_post$jobs_post_major_id_20bd7e32_fk_jobs_major_id] FOREIGN KEY([major_id])
REFERENCES [jobdb].[jobs_major] ([id])
GO
ALTER TABLE [jobdb].[jobs_post] CHECK CONSTRAINT [jobs_post$jobs_post_major_id_20bd7e32_fk_jobs_major_id]
GO
ALTER TABLE [jobdb].[jobs_post]  WITH NOCHECK ADD  CONSTRAINT [jobs_post$jobs_post_user_id_d4bf4781_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_post] CHECK CONSTRAINT [jobs_post$jobs_post_user_id_d4bf4781_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_rating]  WITH NOCHECK ADD  CONSTRAINT [jobs_rating$jobs_rating_creator_id_776f361e_fk_jobs_user_id] FOREIGN KEY([creator_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_rating] CHECK CONSTRAINT [jobs_rating$jobs_rating_creator_id_776f361e_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_rating]  WITH NOCHECK ADD  CONSTRAINT [jobs_rating$jobs_rating_hirer_id_77b212a0_fk_jobs_user_id] FOREIGN KEY([hirer_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_rating] CHECK CONSTRAINT [jobs_rating$jobs_rating_hirer_id_77b212a0_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_token]  WITH NOCHECK ADD  CONSTRAINT [jobs_token$jobs_token_user_id_443fe749_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_token] CHECK CONSTRAINT [jobs_token$jobs_token_user_id_443fe749_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_user_groups]  WITH NOCHECK ADD  CONSTRAINT [jobs_user_groups$jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [jobdb].[auth_group] ([id])
GO
ALTER TABLE [jobdb].[jobs_user_groups] CHECK CONSTRAINT [jobs_user_groups$jobs_user_groups_group_id_8c4ec9ac_fk_auth_group_id]
GO
ALTER TABLE [jobdb].[jobs_user_groups]  WITH NOCHECK ADD  CONSTRAINT [jobs_user_groups$jobs_user_groups_user_id_c74ea82a_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_user_groups] CHECK CONSTRAINT [jobs_user_groups$jobs_user_groups_user_id_c74ea82a_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_user_user_permissions]  WITH NOCHECK ADD  CONSTRAINT [jobs_user_user_permissions$jobs_user_user_permi_permission_id_e171478b_fk_auth_perm] FOREIGN KEY([permission_id])
REFERENCES [jobdb].[auth_permission] ([id])
GO
ALTER TABLE [jobdb].[jobs_user_user_permissions] CHECK CONSTRAINT [jobs_user_user_permissions$jobs_user_user_permi_permission_id_e171478b_fk_auth_perm]
GO
ALTER TABLE [jobdb].[jobs_user_user_permissions]  WITH NOCHECK ADD  CONSTRAINT [jobs_user_user_permissions$jobs_user_user_permissions_user_id_d7a33063_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_user_user_permissions] CHECK CONSTRAINT [jobs_user_user_permissions$jobs_user_user_permissions_user_id_d7a33063_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[jobs_waiting]  WITH NOCHECK ADD  CONSTRAINT [jobs_waiting$jobs_waiting_user_id_0073a616_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[jobs_waiting] CHECK CONSTRAINT [jobs_waiting$jobs_waiting_user_id_0073a616_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr] FOREIGN KEY([application_id])
REFERENCES [jobdb].[oauth2_provider_application] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] CHECK CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr] FOREIGN KEY([id_token_id])
REFERENCES [jobdb].[oauth2_provider_idtoken] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] CHECK CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr] FOREIGN KEY([source_refresh_token_id])
REFERENCES [jobdb].[oauth2_provider_refreshtoken] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] CHECK CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_accesstoken] CHECK CONSTRAINT [oauth2_provider_accesstoken$oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_application]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_application$oauth2_provider_application_user_id_79829054_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_application] CHECK CONSTRAINT [oauth2_provider_application$oauth2_provider_application_user_id_79829054_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_grant]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_grant$oauth2_provider_gran_application_id_81923564_fk_oauth2_pr] FOREIGN KEY([application_id])
REFERENCES [jobdb].[oauth2_provider_application] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_grant] CHECK CONSTRAINT [oauth2_provider_grant$oauth2_provider_gran_application_id_81923564_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_grant]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_grant$oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_grant] CHECK CONSTRAINT [oauth2_provider_grant$oauth2_provider_grant_user_id_e8f62af8_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_idtoken$oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr] FOREIGN KEY([application_id])
REFERENCES [jobdb].[oauth2_provider_application] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken] CHECK CONSTRAINT [oauth2_provider_idtoken$oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_idtoken$oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_idtoken] CHECK CONSTRAINT [oauth2_provider_idtoken$oauth2_provider_idtoken_user_id_dd512b59_fk_jobs_user_id]
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr] FOREIGN KEY([access_token_id])
REFERENCES [jobdb].[oauth2_provider_accesstoken] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken] CHECK CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr] FOREIGN KEY([application_id])
REFERENCES [jobdb].[oauth2_provider_application] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken] CHECK CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr]
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken]  WITH NOCHECK ADD  CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id] FOREIGN KEY([user_id])
REFERENCES [jobdb].[jobs_user] ([id])
GO
ALTER TABLE [jobdb].[oauth2_provider_refreshtoken] CHECK CONSTRAINT [oauth2_provider_refreshtoken$oauth2_provider_refreshtoken_user_id_da837fce_fk_jobs_user_id]
GO
/****** Object:  StoredProcedure [dbo].[CreateApply]    Script Date: 9/2/2022 5:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[CreateApply] @Description nvarchar(200), @PostID int, @UserID int, @Cv nvarchar(200), @TrangThai int output
as
Begin
	declare @dem int
	set @dem = -1
	select @dem = count(*) 
	from jobdb.jobdb.jobs_apply as a
	where a.post_id = @PostID and
			a.user_id = @UserID
	if @dem > 0 
		begin
			set @TrangThai = 0
		end
	if @dem <= 0
		begin
			Begin Try
				insert into jobdb.jobdb.jobs_apply( active,created_date,updated_date,description, post_id, user_id, CV)
				values (1, GETDATE(),GETDATE() ,@Description, @PostID, @UserID, @Cv)
				if @@ROWCOUNT>0
					Set @TrangThai=1
			End Try
			Begin Catch
				Set @TrangThai=0;
				Throw 50002,'Loi he thong',1
			End Catch
		end
End
return @TrangThai
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.auth_group' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'auth_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.auth_group_permissions' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'auth_group_permissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.auth_permission' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'auth_permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.authtoken_token' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'authtoken_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.django_admin_log' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'django_admin_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.django_content_type' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'django_content_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.django_migrations' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'django_migrations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.django_session' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'django_session'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_apply' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_apply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_category' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_comment' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_major' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_major'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_post' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_rating' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_token' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_user' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_user'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_user_groups' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_user_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_user_user_permissions' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_user_user_permissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.jobs_waiting' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'jobs_waiting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.oauth2_provider_accesstoken' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'oauth2_provider_accesstoken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.oauth2_provider_application' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'oauth2_provider_application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.oauth2_provider_grant' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'oauth2_provider_grant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.oauth2_provider_idtoken' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'oauth2_provider_idtoken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'jobdb.oauth2_provider_refreshtoken' , @level0type=N'SCHEMA',@level0name=N'jobdb', @level1type=N'TABLE',@level1name=N'oauth2_provider_refreshtoken'
GO
USE [master]
GO
ALTER DATABASE [jobdb] SET  READ_WRITE 
GO
