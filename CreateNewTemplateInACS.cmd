@echo off
if "%3" == "" goto args_count_wrong
if "%6" == "" goto args_count_ok

:args_count_wrong
echo ----------------- E R R O R ------------------
echo ----- you provided less than 3 arguments -----
echo ----------------------------------------------
echo This script requires a minimum of 3 and a maximum of 5 command line arguments. 
echo 1) Source Template in double quotes, for example: "CC Elite Multichannel Desktop"
echo 2) Target Template in double quotes, for example: "CCE TEST1"
echo 	remark: if the Source or the Target is not contained spaces, double quotes are not needed 
echo 3) DB IP Address, where the ACS db located, for example: 192.168.12.41
echo 4) DB user(optional), for example: ACS
echo 5) DB password(optional), for example: CCEUser0
echo ----------------- E R R O R ------------------
exit /b 1

:args_count_ok
Set source=%~1
Set target=%~2
if not "%~3" == "" (Set dbserverip=%~3)
if "%~4" == "" (Set user=ACS) else (Set user=%~4)
if "%~5" == "" (Set password=CCEUser0) else (Set password=%~5)
echo Source:     %source% 
echo Target:     %target% 
echo DBServerIP: %dbserverip% 
echo DBUser:     %user%
echo DBPassword: %password%

sqlcmd -S %dbserverip% -U %user% -P %password% -v source="'%source%'" target="'%target%'" -i CreateNewTemplateInACS.sql
SET source= 
SET target=
SET user= 
SET password=

exit /b 0
pause