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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupSochnut', 'ITNVCRMPopupSochnut', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopup', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupSochnut.dll', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Established', 'ITNVCRMPopupSochnut', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'BrowserExe', 'iexplore.exe', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerOpenDelay', '5', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerStyle', '0', 'ITNVCRMPopupSochnut', '0-Normal; 1-Hidden; 2-Minimized; 3-Maximized',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URL', 'http://172.16.5.246/CRMTestSochnut/CRMTest.htm?ani=<ANI>&ucid=<UCID>', 'ITNVCRMPopupSochnut', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupType', '3', 'ITNVCRMPopupSochnut', '1- new ie, 2 - new tab in ie; 3 - in the same tab',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
