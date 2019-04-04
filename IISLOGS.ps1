<#This Is the script to add logic to parse through the ECM ISS Logs#> 

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