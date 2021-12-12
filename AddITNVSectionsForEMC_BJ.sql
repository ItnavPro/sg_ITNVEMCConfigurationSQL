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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupBJ', 'ITNVCRMPopupBJ', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupBJ', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupBJ.dll', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'EnabledDisconnect', 'true', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Autoanswer', 'true', 'ITNVCRMPopupBJ', '',1,1,1,0

exec stpAddTemplatePrimaryEx @AppID, 'URL', 'http://1a.qwerty.com/', 'ITNVCRMPopupBJ', '0-normal; 1-Hidden; 2-Minimized; 3-Maximized',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupBJ', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'UUI Template', 'CallType;Campaign,1;TZ,15;SESSIONID,24;LNG;IDType,1;AUTHORIZED,10;STARTWAITTIME,6', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'JSONDisconnect', '{"Business_Service":"BJCallFromIVRBS","Method_Name":"CallFromIVR","MethodName":"DisconnectCall"}', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'VideoApplication', 'C:\Program Files\TightVNC\WinVNC.exe -connect p#hostname -sharearea 1024x1280+1300+0', 'ITNVCRMPopupBJ', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'VideoCloseApplication', 'C:\Program Files\TightVNC\WinVNC.exe -killallclients', 'ITNVCRMPopupBJ', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
