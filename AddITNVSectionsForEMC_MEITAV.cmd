@echo off
if "%2" == "" goto args_count_wrong
if "%5" == "" goto args_count_ok

:args_count_wrong
echo ----------------- E R R O R ------------------
echo ----- you provided less than 2 arguments -----
echo ----------------------------------------------
echo This script requires a minimum of 2 and a maximum of 4 command line arguments. 
echo 1) Template in double quotes, for example: "CC Elite Multichannel Desktop"
echo 	remark: if the Template is not contained spaces, double quotes are not needed 
echo 2) DB IP Address, where the ACS db located, for example: 192.168.12.41
echo 3) DB user(optional), for example: ACS
echo 4) DB password(optional), for example: CCEUser0
echo example: AddITNVSectionForEMC.cmd "" 192.168.12.12 
echo in this example ITNV sections will be added into CC Elite Multichannel Desktop app template
echo ----------------- E R R O R ------------------
exit /b 1

:args_count_ok
if "%~1" == "" (Set template=CC Elite Multichannel Desktop) else (Set template=%~1)
if not "%~2" == "" (Set dbserverip=%~2)
if "%~3" == "" (Set user=ACS) else (Set user=%~4)
if "%~4" == "" (Set password=CCEUser0) else (Set password=%~5)
echo AppTemplate:	%template% 
echo DBServerIP: 	%dbserverip% 
echo DBUser:     	%user%
echo DBPassword: 	%password%

sqlcmd -S %dbserverip% -U %user% -P %password% -v template="'%template%'" -i AddITNVSectionsForEMC_MEITAV.sql
Set template=
Set user=
Set password=

exit /b 0