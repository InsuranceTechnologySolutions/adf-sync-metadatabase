CREATE TABLE [dbo].[TransferLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[EtuityLinkedServiceID] [int] NOT NULL,
[INSLinkedServiceID] [int] NOT NULL,
[WorkID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TransferLog_WorkID] DEFAULT (newsequentialid()),
[MetaData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDateTime] [datetime] NOT NULL CONSTRAINT [DF_TransferLog_StartDateTime] DEFAULT (getdate()),
[FinishedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransferLog] ADD CONSTRAINT [PK_TransferLog] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransferLog] ADD CONSTRAINT [FK_TransferLog_LinkedServices] FOREIGN KEY ([EtuityLinkedServiceID]) REFERENCES [dbo].[LinkedServices] ([ID])
GO
ALTER TABLE [dbo].[TransferLog] ADD CONSTRAINT [FK_TransferLog_LinkedServices1] FOREIGN KEY ([INSLinkedServiceID]) REFERENCES [dbo].[LinkedServices] ([ID])
GO
