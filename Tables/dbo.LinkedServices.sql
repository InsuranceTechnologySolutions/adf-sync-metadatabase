CREATE TABLE [dbo].[LinkedServices]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Info] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsCustomerDB] [bit] NOT NULL CONSTRAINT [DF_LinkedServices_IsCustomerDB] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkedServices] ADD CONSTRAINT [PK_LinkedServices] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [unique_linkedServiceName] ON [dbo].[LinkedServices] ([Name]) ON [PRIMARY]
GO
