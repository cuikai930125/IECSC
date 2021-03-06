USE [HDGLASRS]
GO
/****** Object:  Sequence [dbo].[SEQ_Z40_LOC_ERR_LOG]    Script Date: 2019/2/11 8:29:17 ******/
CREATE SEQUENCE [dbo].[SEQ_Z40_LOC_ERR_LOG] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999
 NO CACHE 
GO
/****** Object:  Table [dbo].[PSB_OPC_ALARM_GROUP]    Script Date: 2019/2/13 14:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PSB_OPC_ALARM_GROUP](
	[LOC_PLC_NO] [varchar](80) NOT NULL,
	[AREA_NO] [varchar](80) NULL,
	[TAGGROUP] [varchar](80) NULL,
	[KIND] [int] NULL,
	[START_LOACTION] [int] NULL,
	[ISENABLE] [int] NULL CONSTRAINT [DF_PSB_OPC_ALARM_GROUP_ISENABLE]  DEFAULT ((1)),
 CONSTRAINT [PK_PSB_OPC_ALARM_GROUP] PRIMARY KEY CLUSTERED 
(
	[LOC_PLC_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PSB_OPC_ALARM_ITEMS]    Script Date: 2019/2/13 14:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PSB_OPC_ALARM_ITEMS](
	[TAGNAME] [varchar](80) NULL,
	[TAGINDEX] [int] NULL,
	[DISCRIP] [varchar](80) NULL,
	[KIND] [int] NULL,
	[ISENABLE] [int] NULL CONSTRAINT [DF_PSB_OPC_ALARM_ITEMS_ISENABLE]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Z40_LOC_ERR_LOG]    Script Date: 2019/2/13 14:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Z40_LOC_ERR_LOG](
	[OBJID] [numeric](20, 0) NOT NULL,
	[LOC_PLC_NO] [varchar](80) NULL,
	[ERR_DESC] [varchar](80) NULL,
	[ERR_BEGIN_TIME] [datetime] NULL,
	[ERR_END_TIME] [datetime] NULL,
	[ERR_SECONDS] [int] NULL,
 CONSTRAINT [PK_Z40_LOC_ERR_LOG] PRIMARY KEY CLUSTERED 
(
	[OBJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Z40_LOC_ERR_LOG] ADD  CONSTRAINT [DF_Z40_LOC_ERR_LOG_START_DATE]  DEFAULT (getdate()) FOR [ERR_BEGIN_TIME]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PLC编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'LOC_PLC_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'AREA_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组（OPC拼接使用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'TAGGROUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'KIND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起始位置（PLC）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'START_LOACTION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_GROUP', @level2type=N'COLUMN',@level2name=N'ISENABLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OPC项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_ITEMS', @level2type=N'COLUMN',@level2name=N'TAGNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OPC项序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_ITEMS', @level2type=N'COLUMN',@level2name=N'TAGINDEX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_ITEMS', @level2type=N'COLUMN',@level2name=N'DISCRIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_ITEMS', @level2type=N'COLUMN',@level2name=N'KIND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用1有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PSB_OPC_ALARM_ITEMS', @level2type=N'COLUMN',@level2name=N'ISENABLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'OBJID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站台号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'LOC_PLC_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'ERR_DESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'ERR_BEGIN_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'ERR_END_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警持续时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG', @level2type=N'COLUMN',@level2name=N'ERR_SECONDS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输送线报警日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z40_LOC_ERR_LOG'
GO
