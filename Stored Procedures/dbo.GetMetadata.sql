SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Arvid Haugen
-- Create date: 05.11.2024
-- Description:	Save logs
-- Remeber to run.
-- GRANT EXECUTE ON [dbo].[GetMetadata] TO [POC-INSONPrem-TO-Azure]
-- =============================================
CREATE PROCEDURE [dbo].[GetMetadata]	
	@EtuityLinkedServiceName NVARCHAR(512),
	@INSLinkedServiceName NVARCHAR(512)
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @WorkID UNIQUEIDENTIFIER = NEWID(),
			@MetaData NVARCHAR(MAX);

	WITH MetaDataCTE AS (
		SELECT
			SyncTables.TableName,
			@WorkID AS WORKID,	   	    
			(
				SELECT
					SyncedTableKeys.ColumnName,
					SyncedTableKeys.DataType,
					SyncedTableKeys.KeyDataLogicID
				FROM dbo.SyncedTableKeys
				WHERE SyncedTableKeys.SyncedTableID = SyncTables.ID
				FOR JSON PATH
			) AS SyncedTableKeys,
			SyncTables.TableMappings
		FROM dbo.SyncTables SyncTables
		INNER JOIN dbo.SyncTableSyncConfiguration SyncTableSyncConfiguration ON SyncTables.ID = SyncTableSyncConfiguration.SyncTableID 
		INNER JOIN dbo.SyncConfigurations SyncConfigurations ON SyncConfigurations.ID = SyncTableSyncConfiguration.SyncConfigurationID
		INNER JOIN dbo.LinkedServices LinkedServicesEtuity ON LinkedServicesEtuity.ID = SyncConfigurations.EtuityLinkedServiceID
		INNER JOIN dbo.LinkedServices LinkedServicesINS ON LinkedServicesINS.ID = SyncConfigurations.INSLinkedServiceID
		WHERE SyncConfigurations.IsActive = 1 
			AND SyncTables.IsActive = 1 			
			AND LinkedServicesEtuity.IsCustomerDB = 0 
			AND LinkedServicesINS.IsCustomerDB = 1
			AND LinkedServicesEtuity.Name = @EtuityLinkedServiceName
			AND LinkedServicesINS.Name = @INSLinkedServiceName)
	SELECT @MetaData = (SELECT * FROM MetaDataCTE FOR JSON PATH);

	INSERT INTO dbo.TransferLog (EtuityLinkedServiceID, INSLinkedServiceID, WorkID, MetaData)	
	SELECT 
    Etuity.ID AS EtuityID, 
    INS.ID AS INSID,
	@WorkID AS WorkID,
	@MetaData AS MetaData
		FROM 
			LinkedServices Etuity
		CROSS JOIN 
			LinkedServices INS
		WHERE 
			Etuity.Name = @EtuityLinkedServiceName
			AND INS.Name = @INSLinkedServiceName;	

	SELECT @MetaData AS JSONData

END;

--GRANT execute on dbo.FinalizeUpdate TO  [POC-INSOnPrem-to-Azure]
GO
GRANT EXECUTE ON  [dbo].[GetMetadata] TO [POC-INSOnPrem-to-Azure]
GO
