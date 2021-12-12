copy this dir on the sql server 
open cmd
cd <to this dir>
run the following command
AddITNVSectionsForEMC.cmd "<template>" <DBServerIP> <DBUser> <DBPassword>

This script requires a minimum of 2 and a maximum of 4 command line arguments. 
	1) Template in double quotes, for example: "CC Elite Multichannel Desktop"
	 	remark: if the Source or the Target is not contained spaces, double quotes are not needed 
	2) DB IP Address, where the ACS db located, for example: 192.168.12.41
	3) DB user(optional), for example: ACS
	4) DB password(optional), for example: CCEUser0
EXAMPLE:
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246 ACS CCEUser0
AddITNVSectionsForEMC.cmd "CC Elite Multichannel Desktop" 172.16.5.246 
AddITNVSectionsForEMC.cmd "" 172.16.5.246
The last example adds sections into CC Elite Multichannel Desktop
