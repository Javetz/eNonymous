USE [master]
GO
/****** Object:  Database [eNonymous]    Script Date: 2015/08/05 09:40:26 AM ******/
CREATE DATABASE [eNonymous]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eNonymous', FILENAME = N'G:\MSSQL\DATA\eNonymous.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eNonymous_log', FILENAME = N'G:\MSSQL\DATA\eNonymous_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eNonymous] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eNonymous].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eNonymous] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eNonymous] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eNonymous] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eNonymous] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eNonymous] SET ARITHABORT OFF 
GO
ALTER DATABASE [eNonymous] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eNonymous] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [eNonymous] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eNonymous] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eNonymous] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eNonymous] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eNonymous] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eNonymous] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eNonymous] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eNonymous] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eNonymous] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eNonymous] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eNonymous] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eNonymous] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eNonymous] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eNonymous] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eNonymous] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eNonymous] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eNonymous] SET RECOVERY FULL 
GO
ALTER DATABASE [eNonymous] SET  MULTI_USER 
GO
ALTER DATABASE [eNonymous] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eNonymous] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eNonymous] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eNonymous] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eNonymous', N'ON'
GO
USE [eNonymous]
GO
/****** Object:  StoredProcedure [dbo].[p_PopulateData]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_PopulateData] 
AS
BEGIN

declare @sprintName varchar(255)
SET @sprintName = '101'
IF NOT EXISTS(SELECT 1 FROM [dbo].[Sprint] WHERE [NAME] = @sprintName)
BEGIN
	INSERT INTO [dbo].[Sprint]([Name])
	VALUES (@sprintName)
END

SET @sprintName = '102'
IF NOT EXISTS(SELECT 1 FROM [dbo].[Sprint] WHERE [NAME] = @sprintName)
BEGIN
	INSERT INTO [dbo].[Sprint]([Name])
	VALUES (@sprintName)
END

SET @sprintName = '103'
IF NOT EXISTS(SELECT 1 FROM [dbo].[Sprint] WHERE [NAME] = @sprintName)
BEGIN
	INSERT INTO [dbo].[Sprint]([Name])
	VALUES (@sprintName)
END

declare @scrumTeamName varchar(255)
SET @scrumTeamName = 'Green'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

SET @scrumTeamName = 'Red'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

SET @scrumTeamName = 'Blue'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

SET @scrumTeamName = 'FrontEnd'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

SET @scrumTeamName = 'BackEnd'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

SET @scrumTeamName = 'Ops'
IF NOT EXISTS(SELECT 1 FROM [dbo].ScrumTeam WHERE [NAME] = @scrumTeamName)
BEGIN
	INSERT INTO [dbo].ScrumTeam([Name])
	VALUES (@scrumTeamName)
END

declare @tagName varchar(255)
SET @tagName = '#Reviews'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#DevTesting'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#PairProgramming'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Merges'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Specs'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Caring'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Kindness'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Management'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Planning'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#AmazingService'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#Learning'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#NewTech'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

SET @tagName = '#CodeKatas'
IF NOT EXISTS(SELECT 1 FROM [dbo].Tag WHERE [NAME] = @tagName)
BEGIN
	INSERT INTO [dbo].Tag([Name])
	VALUES (@tagName)
END

IF NOT EXISTS(SELECT 1 FROM [dbo].Post)
BEGIN
	INSERT INTO [dbo].[Post]
			   ([Title]
			   ,[Description]
			   ,[Timestamp]
			   ,[Status]
			   ,[SprintId]
			   ,[ScrumTeamId])
     VALUES
           ('Innovation is going well'
           ,'Teams are planning'
           ,getdate()
           ,1
           ,1
           ,1)
END


IF NOT EXISTS(SELECT 1 FROM [dbo].PostTags)
BEGIN
	INSERT INTO [dbo].[PostTags]
			   ([PostId]
			   ,[TagId])
     VALUES
           (1,1)

	INSERT INTO [dbo].[PostTags]
			   ([PostId]
			   ,[TagId])
     VALUES
           (1,2)
	INSERT INTO [dbo].[PostTags]
			   ([PostId]
			   ,[TagId])
     VALUES
           (1,3)

END


SELECT * FROM [dbo].[Sprint]
SELECT * FROM [dbo].[ScrumTeam]
SELECT * FROM [dbo].[Tag]
SELECT * FROM [dbo].Post
SELECT * FROM [dbo].PostTags

END

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[Timestamp] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[SprintId] [int] NULL,
	[ScrumTeamId] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScrumTeam]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScrumTeam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ScrumTeam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sprint]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sprint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Sprint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2015/08/05 09:40:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_ScrumTeam] FOREIGN KEY([ScrumTeamId])
REFERENCES [dbo].[ScrumTeam] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_ScrumTeam]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Sprint] FOREIGN KEY([SprintId])
REFERENCES [dbo].[Sprint] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Sprint]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Post]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tag]
GO
USE [master]
GO
ALTER DATABASE [eNonymous] SET  READ_WRITE 
GO
