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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupMeiavivim', 'ITNVCRMPopupMeiavivim', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupMeiavivim', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopup_Meiavivim.dll', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'BrowserExe', 'C:\Program Files\Google\Chrome\Application\chrome.exe', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'BrowserParams', '', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CRMURL', 'https://avivimdev.crm4.dynamics.com//WebResources/pws_incomingCall.html?data=', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CRMURLParams', 'ANI=<ANI>&UCID=<UCID>&IDNUMBER=<ContractNumber>', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'UUITemplate', 'Idkunnefashot;IdentificationLevel;ContractNumber;CallType;VDN;TransferIvrPoint;Lang', 'ITNVCRMPopupMeiavivim', '',1,1,1,0

exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupMeiavivim', 'Alerting/Established',1,1,1,0

exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupMeiavivim', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'TestUUI', '0;3;004101440;0;21003;B100.21;HEB;', 'ITNVCRMPopupMeiavivim', 'Value has to be empty for production',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
