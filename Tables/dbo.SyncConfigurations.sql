CREATE TABLE [dbo].[SyncConfigurations]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[INSLinkedServiceID] [int] NOT NULL,
[EtuityLinkedServiceID] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_SyncConfigurations_IsActive] DEFAULT ((0)),
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncConfigurations] ADD CONSTRAINT [PK_SyncConfigurations] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncConfigurations] ADD CONSTRAINT [UQ_SyncConfigurations_EtuityLinkedServiceID] UNIQUE NONCLUSTERED ([EtuityLinkedServiceID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncConfigurations] ADD CONSTRAINT [UQ_SyncConfigurations_INSLinkedServiceID] UNIQUE NONCLUSTERED ([INSLinkedServiceID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Name] ON [dbo].[SyncConfigurations] ([Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SyncConfigurations] ADD CONSTRAINT [FK_SyncConfigurations_LinkedServices] FOREIGN KEY ([INSLinkedServiceID]) REFERENCES [dbo].[LinkedServices] ([ID])
GO
ALTER TABLE [dbo].[SyncConfigurations] ADD CONSTRAINT [FK_SyncConfigurations_LinkedServices1] FOREIGN KEY ([EtuityLinkedServiceID]) REFERENCES [dbo].[LinkedServices] ([ID])
GO
