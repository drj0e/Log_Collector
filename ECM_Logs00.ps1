#Script to copy logs files and stuff#
#Create directory for logs, add folder for ISS Logs from IISLOGS.ps1#
New-Item -Path "C:\" -Name "Temp2" -ItemType "directory"
New-Item -Path "C:\Temp2" -Name "IISLOGS" -ItemType "directory"

#Copy Logs files from soruce to destination#

Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\Temp2"
Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\Temp2"
Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\Temp2"
Copy-Item "C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs" -Destination "C:\Temp2\AppLogs" -Recurse
Copy-Item "C:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts\*" -Destination "C:\Temp2\IQPRODUCTS" -Recurse
Copy-Item "C:\SVReports\*" -Destination "C:\Temp2\SVRREPORTS" -Recurse
Copy-Item "C:\Users\opl_svc\AppData\Roaming\Agilent Technologies\ECM Server Configuration Wizard\1.0.0.0" -Destination "C:\Temp2\CONFIGWIZARD" -Recurse
Copy-Item "C:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes" -Destination "C:\Temp2\HOTFIXES" -Recurse

#Run IISLOGS to collect the IIS log files for 10 days#
& C:\Temp\IISLOGS.ps1

#Zip and copy the final result set to the user desktop#
Compress-Archive -LiteralPath C:\Temp2 -CompressionLevel Optimal -DestinationPath "%userprofile%\Desktop\ECM Logs" -Force
