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
exec stpAddTemplatePrimaryEx @AppID, 'ITNVSingleInstance', 'ITNVSingleInstance', 'Plug In Assembly List', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNVTopmostForm', 'ITNVTopmostForm', 'Plug In Assembly List', '', 1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNVUnchangeableFormSize', 'ITNVUnchangeableFormSize', 'Plug In Assembly List', '', 1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNVInvisibleIcons', 'ITNVInvisibleIcons', 'Plug In Assembly List', '', 1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNAVPROGeneral', 'ITNAVPROGeneral Plugin', 'Plug In Assembly List', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ITNVIVIMyPro', 'ITNVIVIMyPro', 'Plug In Assembly List', '', 1,1,1,0


EXEC stpAddTemplateSection 'ITNVSingleInstance', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVSingleInstance.dll', 'ITNVSingleInstance', '',1,1,1,0

EXEC stpAddTemplateSection 'ITNVTopmostForm', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVTopmostForm.dll', 'ITNVTopmostForm', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'TopMost', 'false', 'ITNVTopmostForm', 'If TopMost=true,in the User section change the Assembly File Name from ASGUIHUserPlugin.dll to ITNVGUIHUserPlugin.dll',1,1,1,0

EXEC stpAddTemplateSection 'ITNVUnchangeableFormSize', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVUnchangeableFormSize.dll', 'ITNVUnchangeableFormSize', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Desktop Sizable', 'false', 'ITNVUnchangeableFormSize', '',1,1,1,0

EXEC stpAddTemplateSection 'ITNVInvisibleIcons', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVInvisibleIcons.dll', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Chat', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Custom', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible DMCC', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Email', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Home', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible PCMS', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Reporting', 'false', 'ITNVInvisibleIcons', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Visible Voice', 'false', 'ITNVInvisibleIcons', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNAVPROGeneral', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'EMCDesktopPluginGeneral.dll', 'ITNAVPROGeneral', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Project', 'ITNAV', 'ITNAVPROGeneral', '',1,1,1,0

EXEC stpAddTemplateSection '>ITNAVMain', ''
exec stpAddTemplatePrimaryEx @AppID, 'PersonalGreeting', '', 'ITNAVMain', 'Humt group extension for personal greetong IVR app',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'RoboHoldDTMF', '', 'ITNAVMain', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'RoboHoldVDNS', '', 'ITNAVMain', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'AutoanswerStationLength', '', 'ITNAVMain', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PersonalGreetingLength', '', 'ITNAVMain', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'LangPosition', '', 'ITNAVMain', 'Language position in UUI of the incoming call',1,1,1,0

EXEC stpAddTemplateSection 'ITNVIVIMyPro', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVIVIMyPro.dll', 'ITNVIVIMyPro', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'false', 'ITNVIVIMyPro', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProExe', '', 'ITNVIVIMyPro', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProConfigURL', '', 'ITNVIVIMyPro', 'BBRT Config URL',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProBackendURL', '', 'ITNVIVIMyPro', 'BBRT Backend URL',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProPort', '9000', 'ITNVIVIMyPro', 'to open the port run(on each client,cmd admin) : netsh http add urlacl url=http://+:9000/ user=Everyone ',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProEvent', 'Alerting', 'ITNVIVIMyPro', 'Alerting/Established', 1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'IVIMyProAgentGroup', '', 'ITNVIVIMyPro', 'template group in BBRT',1,1,1,0
END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
