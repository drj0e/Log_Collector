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