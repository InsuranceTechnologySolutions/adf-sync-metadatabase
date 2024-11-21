CREATE TABLE [dbo].[SyncedTableKeys]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[SyncedTableID] [int] NOT NULL,
[ColumnName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataType] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[KeyDataLogicID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncedTableKeys] ADD CONSTRAINT [PK_SyncedTableKeys] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Unique_ColumName] ON [dbo].[SyncedTableKeys] ([SyncedTableID], [ColumnName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncedTableKeys] ADD CONSTRAINT [FK_SyncedTableKeys_KeyDataLogic] FOREIGN KEY ([KeyDataLogicID]) REFERENCES [dbo].[KeyDataLogic] ([ID])
GO
ALTER TABLE [dbo].[SyncedTableKeys] ADD CONSTRAINT [FK_SyncedTableKeys_SyncTables] FOREIGN KEY ([SyncedTableID]) REFERENCES [dbo].[SyncTables] ([ID])
GO
