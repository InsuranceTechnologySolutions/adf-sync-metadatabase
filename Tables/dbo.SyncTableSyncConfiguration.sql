CREATE TABLE [dbo].[SyncTableSyncConfiguration]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[SyncTableID] [int] NOT NULL,
[SyncConfigurationID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncTableSyncConfiguration] ADD CONSTRAINT [FK_SyncTableSyncConfiguration_SyncConfigurations] FOREIGN KEY ([SyncConfigurationID]) REFERENCES [dbo].[SyncConfigurations] ([ID])
GO
ALTER TABLE [dbo].[SyncTableSyncConfiguration] ADD CONSTRAINT [FK_SyncTableSyncConfiguration_SyncTables] FOREIGN KEY ([SyncTableID]) REFERENCES [dbo].[SyncTables] ([ID])
GO
