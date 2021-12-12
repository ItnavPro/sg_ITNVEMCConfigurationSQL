copy this dir on the sql server 
open cmd
cd <to this dir>
run the following command
CreateNewTemlateInACS.cmd "<source template>" "<new template>" <DBServerIP> <DBUser> <DBPassword>

This script requires a minimum of 3 and a maximum of 5 command line arguments. 
	1) Source Template in double quotes, for example: "CC Elite Multichannel Desktop"
	2) Target Template in double quotes, for example: "CCE TEST1"
	 	remark: if the Source or the Target is not contained spaces, double quotes are not needed 
	3) DB IP Address, where the ACS db located, for example: 192.168.12.41
	4) DB user(optional), for example: ACS
	5) DB password(optional), for example: CCEUser0
EXAMPLE
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" "NEW AGENT DESKTOP" 172.16.5.246 ACS CCEUser0
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" TEST2 172.16.5.246 ACS CCEUser0
CreateNewTemlateInACS.cmd "CC Elite Multichannel Desktop" TEST3 172.16.5.246 
