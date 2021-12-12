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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupMimunYashir', 'ITNVCRMPopupMimunYashir', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupMimunYashir', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupMimunYashir.dll', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerExe', 'iexplore.exe', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerOpenDelay', '1', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupMimunYashir', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CalledDNforURL', '&MT_VDN=', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLlogin', 'http://www.walla.com', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URL', 'http://172.16.5.207/WSExample/WSExample.asmx/Hello?&IdNumber=<VALUE>&BSIND=1&IDNTIND=<Y>', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLani', 'http://172.16.5.207/WSExample/WSExample.asmx/Hello?&Phone=<VALUE>&BSIND=1&IDNTIND=<Y>', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'URLlead', 'http://172.16.5.207/WSExample/WSExample.asmx/Hello?&LeadId=<VALUE>&BSIND=1&IDNTIND=<Y>', 'ITNVCRMPopupMimunYashir', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupType', '3', 'ITNVCRMPopupMimunYashir', '1- new ie, 2 - new tab in ie; 3 - in the same tab',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Prefix', '03', 'ITNVCRMPopupMimunYashir', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
