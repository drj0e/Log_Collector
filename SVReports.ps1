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