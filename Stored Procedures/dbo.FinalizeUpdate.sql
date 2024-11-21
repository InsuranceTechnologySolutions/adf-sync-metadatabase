SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Arvid Haugen
-- Create date: 05.11.2024
-- Description:	Log done "time" - possible remove this?
-- =============================================
CREATE PROCEDURE [dbo].[FinalizeUpdate]	
	@WorkID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.TransferLog SET FinishedDateTime = Getdate() WHERE WorkID = @WorkID
END;

--GRANT execute on dbo.FinalizeUpdate TO  [POC-INSOnPrem-to-Azure]
GO
GRANT EXECUTE ON  [dbo].[FinalizeUpdate] TO [POC-INSOnPrem-to-Azure]
GO
