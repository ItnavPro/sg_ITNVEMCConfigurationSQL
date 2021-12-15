# SQL scripts to create ITNV sections, keys/values for ITNV plugins

After creating ACS data base
Download this git repository on local drive of a computer.

THis computer must have sqlcmd command
Open the downloaded zip file to any new directory.\

Pay attention: All these commands can run on a computer contained sqlcmd.exe
(SQLServer or SSMS).

## If you need to create a new Application template 
open cmd\
cd <to this dir>\
run the following command\
```
CreateNewTemlateInACS.cmd "<source template>" "<new template>" <DBServerIP> <DBUser> <DBPassword>
```
This script requires a minimum of 3 and a maximum of 5 command line arguments:
If the first command will be _SETdbserverip.cmd <DBServerIP>, 
then db server ip address can be "" in other cmds (double quotes).
	1. Source Template in double quotes, for example: "CC Elite Multichannel Desktop"\
	2. Target Template in double quotes, for example: "CCE TEST1"\
	 	remark: if the Source or the Target is not contained spaces, double quotes are not needed \
	3. DB IP Address, where the ACS db located, for example: 192.168.12.41\
	4. DB user(optional), for example: ACS\
	5. DB password(optional), for example: CCEUser0\
EXAMPLE:\
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" "NEW AGENT DESKTOP" 172.16.5.246 ACS CCEUser0\
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" TEST2 172.16.5.246 ACS CCEUser0\
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" TEST3 172.16.5.246 
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" TEST3 ""  - if _SETdbserverip.cmd was launched first in CMD




## If you do not need to create a new Application Template and would like to add ITNAV Pligins only
## you could skip the previouse step 
## and run the following steps only

open cmd\
cd <to this dir>\
run the following command
```
AddITNVSectionsForEMC.cmd "<template>" <DBServerIP> <DBUser> <DBPassword>
```
This script requires a minimum of 2 and a maximum of 4 command line arguments. 
If the first command will be _SETdbserverip.cmd <DBServerIP>, 
then db server ip address can be "" in other cmds (double quotes).
	1. Template in double quotes, for example: "CC Elite Multichannel Desktop"
	 	remark: if the Source or the Target is not contained spaces, double quotes are not needed 
	2. DB IP Address, where the ACS db located, for example: 192.168.12.41
	3. DB user(optional), for example: ACS
	4. DB password(optional), for example: CCEUser0
	
EXAMPLE:\
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0\
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0\
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246\ 
AddITNVSectionsForEMC.cmd "" 172.16.5.246\
AddITNVSectionsForEMC.cmd "" ""  - if _SETdbserverip.cmd was launched first in CMD\
The last example adds sections into CC Elite Multichannel Desktop by default.

## Plugins for  specific customers

AddITNVSectionsForEMC_Amidar.cmd\
AddITNVSectionsForEMC_Ayalon.cmd\
AddITNVSectionsForEMC_BJ.cmd\
AddITNVSectionsForEMC_ECAandPAISandSHELA.cmd\
AddITNVSectionsForEMC_HOTMobile.cmd\
AddITNVSectionsForEMC_HOTSf_Poper_dtmfEMSPlugin.cmd\
AddITNVSectionsForEMC_HOT_Helpdesk.cmd\
AddITNVSectionsForEMC_Maccabi.cmd\
AddITNVSectionsForEMC_MeiAvivim_Dynamics365.cmd\
AddITNVSectionsForEMC_MEITAV.cmd\
AddITNVSectionsForEMC_MimunYashir.cmd\
AddITNVSectionsForEMC_Sochnut.cmd

These commands launch for specific customer to create configuration for it.
EXAMPLE for Amidar:\
AddITNVSectionsForEMC_Amidar.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0\
AddITNVSectionsForEMC_Amidar.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0\
AddITNVSectionsForEMC_Amidar.cmd "CC Elite Multichannel Desktop" 172.16.5.246\ 
AddITNVSectionsForEMC_Amidar.cmd "" 172.16.5.246\
AddITNVSectionsForEMC_Amidar.cmd "" "" - if _SETdbserverip.cmd was launched first in CMD
The last example adds sections into CC Elite Multichannel Desktop by default. 