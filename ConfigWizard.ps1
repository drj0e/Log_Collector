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