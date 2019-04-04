$(

$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptPath = Join-Path $executingScriptDirectory "scriptb.ps1"
Invoke-Expression ".\Apps\ECMAutoSVT.exe"
Start-Sleep -Seconds 60
Stop-Process -Name SFVTool -Force


#################################################################################################################
#Create directory for logs, add folder for ISS Logs from IISLOGS, RUN AutoIT EXE to generate new SVT Reports.ps1#
#################################################################################################################

Try
{
New-Item -Path "C:\users\$env:username\Desktop\" -Name "Agilent_Logs" -ItemType "directory" 
New-Item -Path "C:\users\$env:username\Desktop\Agilent_Logs" -Name "IISLOGS" -ItemType "directory"
}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}


############################################
#Copy Logs files from soruce to destination#
############################################

Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows System Logs"

Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows Application Logs"

Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows Security Logs"

$last = [DateTime]::Today.AddDays(-2).ToShortDateString()
Get-EventLog -LogName Application -After $last  -EntryType Error | FL *  | Out-File C:\users\$env:username\Desktop\Agilent_Logs\Apps.txt -Force
Get-EventLog -LogName System -After $last  -EntryType Error | FL * | Out-File C:\users\$env:username\Desktop\Agilent_Logs\System.txt -Force
Get-CimInstance Win32_OperatingSystem | FL *  | Out-File C:\users\$env:username\Desktop\Agilent_Logs



#####################################################
#Run IISLOGS to collect the IIS log files for 5 days#
#####################################################

Try
{
$RemotePath = "C:\inetpub\logs\LogFiles\W3SVC1\"
$LocalPath = "C:\users\$env:username\Desktop\Agilent_Logs\IISLogs"
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


##################################
#Run ECM Application Service Logs#
##################################

 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not Found"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not Found"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\ECM Application Service Logs" -Recurse 
 }
    else { Write-Host "Not Found"
 }


################
#Run IQProducts#
################

 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\IQTool\SFVTool\IQProducts")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not Found"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not Found"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\IQPRODUCTS" -Recurse 
 }
    else { Write-Host "Not Found"
 }


###############
#Run SVReports#
###############

 $mypath0 = ("C:\SVReports\")
 $mypath1 = ("D:\SVReports\")
 $mypath2 = ("E:\SVReports\")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not Found"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not Found"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\SVReports" -Recurse 
 }
    else { Write-Host "Not Found"
 }


##################
#Run ConfigWizard#
##################

 $mypath0 = ("C:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath1 = ("D:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 $mypath2 = ("E:\Users\$env:Username\AppData\Roaming\Agilent Technologies")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not Found"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not Found"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\CONFIGWIZARD" -Recurse 
 }
    else { Write-Host "Not Found"
 }


##############
#Run Hotfixes#
##############

 $mypath0 = ("C:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath1 = ("D:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 $mypath2 = ("E:\Users\opl_svc\AppData\Roaming\Agilent Technologies\HotFixes")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not Found"
 }
      if ($a[1] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not Found"
 }
    if ($a[2] -eq $True) {
    Write-Host "Log Found"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs\Hotfixes" -Recurse 
 }
    else { Write-Host "Not Found"
 }


#######################
#Run Zip Everything Up#
#######################

Try
{
$source = "C:\users\$env:username\Desktop\Agilent_Logs"

$destination = "C:\users\$env:username\Desktop\ECM_Collection.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 
Write-Host "Zipping the logs and moving them to the desktop"
Start-Sleep -Seconds 5
}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}

)*>&1 > C:\users\$env:username\Desktop\Agilent_Logs.txt
