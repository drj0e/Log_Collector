

##################################Run As Administrator# 
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
$( 

####################Script to copy logs files and stuff#



#Create directory for logs, add folder for ISS Logs from IISLOGS.ps1#
New-Item -Path "C:\" -Name "Temp" -ItemType "directory"
New-Item -Path "C:\Temp" -Name "IISLOGS" -ItemType "directory"
#New-Item -Path "C:\" -Name "ECM_Collection.txt" -ItemType "file"# 



#######################Copy Logs files from soruce to destination#

Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\Temp"
Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\Temp"
Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\Temp"
Write-Host " Complete"


###################Run IISLOGS to collect the IIS log files for 5 days#
#This Is the script to add logic to parse through the ECM ISS Logs#

$RemotePath = "C:\inetpub\logs\LogFiles\W3SVC1\"
$LocalPath = "C:\temp\IISLogs"
$Max_days = "-3"
#Max_mins = "-5"
$Curr_date = get-date

#Checking date and then copying file from RemotePath to LocalPath
Foreach($file in (Get-ChildItem $RemotePath))
{
    if($file.LastWriteTime -gt ($Curr_date).adddays($Max_days))
    {
        
        Copy-Item -Path $file.fullname -Destination $LocalPath
        #Move-Item -Path $file.fullname -Destination $LocalPath
    }
    ELSE
    {"not copying $file"
    }

}


############Run ECM Application Service Logs#
 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Temp\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Temp\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Temp\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }









#######################Run IQProducts#
 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Temp\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Temp\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Temp\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }


####################Run SVReports#
 $mypath0 = ("C:\SVReports\")
 $mypath1 = ("D:\SVReports\")
 $mypath2 = ("E:\SVReports\")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Temp\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Temp\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Temp\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }


###################Run ConfigWizard#
 $mypath0 = ("C:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath1 = ("D:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath2 = ("E:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Temp\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Temp\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Temp\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }


#######################Run Hotifxes#
 $mypath0 = ("C:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath1 = ("D:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath2 = ("E:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Temp\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Temp\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "HEY IM HERE!!!!! :)"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Temp\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }


###############Zip It up to the desktop
$source = "C:\Temp"

$destination = "C:\users\$env:username\Desktop\ECM_Collection.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 


)*>&1 > C:\ECM_Collection.txt
