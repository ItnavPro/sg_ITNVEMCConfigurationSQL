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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopup', 'ITNVCRMPopup', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopup', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopup.dll', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Established', 'ITNVCRMPopup', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerExe', 'iexplore.exe', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerOpenDelay', '5', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerStyle', '0', 'ITNVCRMPopup', '0-Normal; 1-Hidden; 2-Minimized; 3-Maximized',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLTZ', 'http://172.16.5.207/WSExample/WSExample.asmx/TestWOparam?user=<IVRParam>', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLHP', 'http://172.16.5.207/WSExample/WSExample.asmx/TestWOparam?user=<IVRParam>&2', 'ITNVCRMPopup', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupType', '3', 'ITNVCRMPopup', '1- new ie, 2 - new tab in ie; 3 - in the same tab',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLUNIDENT: ', '', 'ITNVCRMPopup', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
