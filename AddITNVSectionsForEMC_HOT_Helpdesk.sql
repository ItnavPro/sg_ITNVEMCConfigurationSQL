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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVHOTHelpdeskEMCPlugin', 'ITNVHOTHelpdeskEMCPlugin', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVHOTHelpdeskEMCPlugin', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVHOTHelpdeskEMCPlugin.dll', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ApplicationExe', 'c:\windows\system32\notepad.exe', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVHOTHelpdeskEMCPlugin', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'TimerEnabled', 'true', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CheckUUIlength', 'false', 'ITNVHOTHelpdeskEMCPlugin', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
