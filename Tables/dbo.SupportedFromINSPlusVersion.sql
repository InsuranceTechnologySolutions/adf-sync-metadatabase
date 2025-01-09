CREATE TABLE [dbo].[SupportedFromINSPlusVersion]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[INSPlusVersion] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SupportedFromINSPlusVersion] ADD CONSTRAINT [PK_SupportedFromINSPlusVersion] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
