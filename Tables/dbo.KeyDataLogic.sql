CREATE TABLE [dbo].[KeyDataLogic]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KeyDataLogic] ADD CONSTRAINT [PK_KeyDataLogic] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
