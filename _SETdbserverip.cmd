@echo off
if "%1" == "" goto args_count_wrong
if "%2" == "" goto args_count_ok

:args_count_wrong
echo ----------------- E R R O R ---------------
echo ----- you did not provide an argument -----
echo -------------------------------------------
echo This script requires dbserver ipaddress as
echo a line argument(or dbserver name). 
echo example: 
echo _SETdbserverip.cmd 192.168.12.12 
exit /b 1

:args_count_ok
Set dbserverip=%~1
exit /b 0