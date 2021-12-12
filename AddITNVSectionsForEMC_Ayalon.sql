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

exec stpAddTemplatePrimaryEx @AppID, 'ITNVCRMPopupAyalon', 'ITNVCRMPopupAyalon', 'Plug In Assembly List', '',1,1,1,0


EXEC stpAddTemplateSection 'ITNVCRMPopupAyalon', ''
exec stpAddTemplatePrimaryEx @AppID, 'Assembly File Name', 'ITNVCRMPopupAyalon.dll', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'Enabled', 'true', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerExe', 'iexplore.exe', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'ExplorerOpenDelay', '1', 'ITNVCRMPopupAyalon', '',1,1,1,0

exec stpAddTemplatePrimaryEx @AppID, 'ExplorerStyle', '0', 'ITNVCRMPopupAyalon', '0-normal; 1-Hidden; 2-Minimized; 3-Maximized',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'PopupEvent', 'Alerting', 'ITNVCRMPopupAyalon', 'Alerting/Established',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'CallerDNLength', '7', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M01', '7;R100,R105', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M01UUI', 'VDN;InternalNumber;ClaimNumber;OtpStatus;PhoneNumber;IdNumber;ModuleName', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M01URL', 'http://ayl-crm-tv:5555/isv/ayalon.briyut.web/SearchPage.aspx?IdNumber=#IdNumber&ClaimNumber=#ClaimNumber&CarNumber=#InternalNumber&OtpStatus=#OtpStatus&PhoneNumber=#PhoneNumber', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M02', '6;R200,R205', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M02UUI', 'VDN;InternalNumber;OtpStatus;PhoneNumber;IdNumber;ModuleName', 'ITNVCRMPopupAyalon', '',1,1,1,0
exec stpAddTemplatePrimaryEx @AppID, 'M02URL', 'https://www.google.com?InshNumber=#InternalNumber&OtpStatus=#OtpStatus&PhoneNumber=#PhoneNumber&IdNumber=#IdNumber', 'ITNVCRMPopupAyalon', '',1,1,1,0

END
ELSE
PRINT 'App template ' + @AppName  + ' not found'
