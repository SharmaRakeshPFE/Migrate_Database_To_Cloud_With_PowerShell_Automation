## This database will store important stats ##
CREATE DATABASE GET_AZURESQL_STATS
GO


USE [GET_AZURESQL_STATS]
GO
/****** Object:  Table [dbo].[TBL_BACPAC_LOCATIONS]    Script Date: 4/7/2021 6:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_BACPAC_LOCATIONS](
	[TimeStamp] [datetime] NULL,
	[LSERVER] [varchar](200) NULL,
	[DATABASENAME] [varchar](100) NULL,
	[BACPAC_PATH] [varchar](300) NULL,
	[RESTORE_DB_NAME]  AS ([DATABASENAME]+'_TEMP_R'),
	[RESTORE_FLAG] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_BACPAC_TIMESTAMP]    Script Date: 4/7/2021 6:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_BACPAC_TIMESTAMP](
	[LSERVER] [varchar](200) NULL,
	[DATABASENAME] [varchar](100) NULL,
	[STATUS] [varchar](100) NULL,
	[BACPAC_TIMESTAMP] [datetime] NULL,
	[SIZE_MB] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CREDENTIAL]    Script Date: 4/7/2021 6:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CREDENTIAL](
	[LOGICAL_SERVER] [varchar](400) NULL,
	[USERNAME] [varchar](100) NULL,
	[PWD] [varchar](200) MASKED WITH (FUNCTION = 'default()') NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_BACPAC_LOCATIONS] ADD  CONSTRAINT [DF__TBL_BACPA__TimeS__40F9A68C]  DEFAULT (getdate()) FOR [TimeStamp]
GO
