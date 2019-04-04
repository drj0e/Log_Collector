

##################################Run As Administrator##############################################################
$( 
Try
{

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}
####################Script to copy logs files and stuff###########################################################################



#Create directory for logs, add folder for ISS Logs from IISLOGS.ps1##############################################################
Try
{
New-Item -Path "C:\" -Name "Agilent_Logs" -ItemType "directory"
New-Item -Path "C:\Agilent_Logs" -Name "IISLOGS" -ItemType "directory"
}
Catch{
Write-Host "an error has occured"
Write-Host $_
}



#######################Copy Logs files from soruce to destination################################################################
Try
{
Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\Agilent_Logs"
Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\Agilent_Logs"
Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\Agilent_Logs"
}

Catch
{
Write-Host "an error has occured"
Write-Host $_
}

###################Run IISLOGS to collect the IIS log files for 5 days###########################################################
#This Is the script to add logic to parse through the ECM ISS Logs#
Try
{
$RemotePath = "C:\inetpub\logs\LogFiles\W3SVC1\"
$LocalPath = "C:\Agilent_Logs\IISLogs"
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
}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}
##################################Run ECM Application Service Logs###########################################################################

 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }









################################################Run IQProducts#########################################################################

 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not here"
 }


###################################################Run SVReports############################################################################

 $mypath0 = ("C:\SVReports\")
 $mypath1 = ("D:\SVReports\")
 $mypath2 = ("E:\SVReports\")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not here"
 }


##############################################Run ConfigWizard#####################################################################

 $mypath0 = ("C:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath1 = ("D:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath2 = ("E:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not here"
 }


###############################################Run Hotifxes############################################################################################

 $mypath0 = ("C:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath1 = ("D:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath2 = ("E:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not here"
 }


#########################################Zip It up to the desktop############################################################

Try
{
$source = "C:\Agilent_Logs"

$destination = "C:\users\$env:username\Desktop\ECM_Collection.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 
}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}

)*>&1 > C:\ECM_Collection.txt