USE ACS
PRINT 'Updating Contact Center Express Desktop Appliction...'

DECLARE @AppName NVARCHAR(200) = $(template)
PRINT 'adding ITNV parameters for template ' + @AppName
DECLARE @AppID int = 0

DECLARE @PrmTemplateID int

SELECT @AppID=AppID  FROM tblApplication WHERE AppName=@AppName
PRINT 'AppID:' + CAST(@AppID  AS VARCHAR(10))

IF @AppID > 0 
BEGIN
exec stpAddTemplatePrimaryEx @AppID, 'ITNVAmidarSMSForm', 'ITNVAmidarSMSForm', 'Plug In Assembly List', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupAmidar', 'ITNVCRMPopupAmidar', 'Plug In Assembly List', '', 1,1,1,0


EXEC stpAddTemplateSection 'ITNVAmidarSMSForm', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVAmidarSMSForm.dll', 'ITNVAmidarSMSForm', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVAmidarSMSForm', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'System', 'AMIDAR', 'ITNVAmidarSMSForm', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'SMSWEBServiceURL', 'http://172.51.120.64:8081/SMSSender/WEBService.asmx', 'ITNVAmidarSMSForm', '',1,1,1,0

EXEC stpAddTemplateSection 'ITNVCRMPopupAmidar', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupAmidar.dll', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'UUITemplate', 'TZ;SYSTEM;VDN;LANG', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength: ', '7', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent: ', 'Alerting', 'ITNVCRMPopupAmidar', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLOracleWebService: ', 'http://10.140.3.8/AmidarOracle/WEBService.asmx', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLOracleWebService2: ', 'http://10.140.3.8/AmidarOracle2/WEBService.asmx', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLOracleWebService3: ', 'http://10.140.3.8/AmidarOracle3/WEBService.asmx', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLOracleWebService4: ', 'http://10.140.3.8/AmidarOracle4/WEBService.asmx', 'ITNVCRMPopupAmidar', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLOracleWebService5: ', 'http://10.140.3.8/AmidarOracle5/WEBService.asmx', 'ITNVCRMPopupAmidar', '',1,1,1,0
END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
