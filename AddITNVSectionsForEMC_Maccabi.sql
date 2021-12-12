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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupMaccabi', 'ITNVCRMPopupMaccabi', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupMaccabi', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopup_Maccabi.dll', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ApplicationExe', 'c:\windows\system32\notepad.exe', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupMaccabi', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'MSCRM_ApplicationExe', 'C:\Users\@Username\Appdata\Roaming\Citrix\SelfService\CrmOrgSoft.exe', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'MSCRM_ApplicationParams','-qlaunch CrmOrgSoft', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'MSCRM_URL', 'http://crmorg/MaccabiHealthcareServices/FindContact/@TZ', 'ITNVCRMPopupMaccabi', '',1,1,1,0 
exec stpAddTemplatePrimaryEx @AppID, 'BOS_ApplicationExe', 'hll-ITNV.exe', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'BOS_ApplicationParams: ', '@UUI', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupMaccabi', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'TestUUI', 'id:123456789;HEB;ZT;898989;703123', 'ITNVCRMPopupMaccabi', 'Value has to be empty for production',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
