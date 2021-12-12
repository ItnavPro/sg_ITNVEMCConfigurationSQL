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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupHOTMobile', 'ITNVCRMPopupHOTMobile', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupHOTMobile', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupHOTMobile.dll', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ApplicationExe', 'c:\windows\system32\notepad.exe', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupHOTMobile', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerExe', 'iexplore.exe', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerOpenDelay','1', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerStyle','1', 'ITNVCRMPopupHOTMobile', '0-normal; 1-Hidden; 2-Minimized; 3-Maximized',1,1,1,0 
exec stpAddTemplatePrimaryEx @AppID, 'URL1','http:http://bss-css-apc.prod1.bss.mirs.corp/myshapecsr/ctiAccess', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URL2','http:http://bss-css-apc.prod1.bss.mirs.corp/myshapecsr/ctiAccess?subscriberExternalId=<MSISDN>&ctiSessionId=<UCID>', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PathandFile', 'C:\Logs\SoftPhone', 'ITNVCRMPopupHOTMobile', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CloseAll IE in start', 'true', 'ITNVCRMPopupHOTMobile', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
