

#Run As Administrator# 
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
$( 

#Script to copy logs files and stuff#



#Create directory for logs, add folder for ISS Logs from IISLOGS.ps1#
New-Item -Path "C:\" -Name "Temp" -ItemType "directory"
New-Item -Path "C:\Temp" -Name "IISLOGS" -ItemType "directory"
#New-Item -Path "C:\" -Name "ECM_Collection.txt" -ItemType "file"# 



#Copy Logs files from soruce to destination#

Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\Temp"
Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\Temp"
Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\Temp"
Write-Host " Complete"


#Run IISLOGS to collect the IIS log files for 5 days#
&'C:\ECM_Collection\IISLOGS.ps1'
Write-Host " Complete"


#Run ECM Application Service Logs#
&'C:\ECM_Collection\ECM Application Service Logs.ps1'
Write-Host " Complete"


#Run IQProducts#
&'C:\ECM_Collection\IQProducts.ps1'
Write-Host " Complete"


#Run SVReports#
& 'C:\ECM_Collection\SVReports.ps1'
Write-Host " Complete"


#Run ConfigWizard#
&'C:\ECM_Collection\ConfigWizard.ps1'
Write-Host " Complete"


#Run Hotifxes#
&'C:\ECM_Collection\Hotfixes.ps1'
Write-Host " Complete"


#Zip It up to the desktop
&'C:\ECM_Collection\Zip_it.ps1'
Write-Host " Complete"


)*>&1 > C:\ECM_Collection.txt
