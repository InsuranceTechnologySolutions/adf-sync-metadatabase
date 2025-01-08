CREATE TABLE [dbo].[SyncTables]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[TableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TableMappings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_SyncTables_IsActive] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncTables] ADD CONSTRAINT [PK_SyncTables] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
