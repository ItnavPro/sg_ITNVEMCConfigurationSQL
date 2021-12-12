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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVHOTSf_Poper_dtmf', 'ITNVHOTSf_Poper_dtmf', 'Plug In Assembly List', '',1,1,1,0

EXEC stpAddTemplateSection 'ITNVHOTSf_Poper_dtmf', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVHOTSf_Poper_dtmfEMSPlugin.dll', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'NotPopupANIs', '74000-74999', 'ITNVHOTSf_Poper_dtmf', '<ani1>-<ani2>;ani3>;<ani4>;<ani5>-<ani6>',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'RoboholdANIs', '0772208030;0522385127', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'RoboholdDTMF', 'A', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVHOTSf_Poper_dtmf', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ApplicationExe', 'popper_crm.exe', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'TestUUI: ', '0;029595959;1;1;;;B100.3.2.3;1;1;HEB;310013;15711637;1006102888;029595959', 'ITNVHOTSf_Poper_dtmf', 'it has to be empty for production',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'KillerApplicationExe', 'KillProcess.exe', 'ITNVHOTSf_Poper_dtmf', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
