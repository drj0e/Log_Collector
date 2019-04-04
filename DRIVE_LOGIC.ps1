if (Test-Path "C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs") { 
        Copy-Item "C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs" -Destination "C:\Temp2\AppLogs" -Recurse
} else {
    Write-Host ("THIS AINT THERE")
}
 


 
 
 #check paths C, D, E for file, which ever returns -eq $True copy item #


 $mypath1 = ("C:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath2 = ("D:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 $mypath3 = ("E:\Program Files (x86)\Agilent Technologies\ECM Application Service\logs")
 
 $a = Test-Path $mypath1, $mypath2, $mypath3
 
 
 if ($mypath1 -eq "True") {
    Write-Host "Penis"
 }
 if ($mypath2 -eq "True") {
    Write-Host "wanker"
 }
 else { Write-Host "balls"
 }
 
 
 
 
 {Copy-Item -Destination "C:\Temp2\AppLogs" -Recurse}
 else {Write-host "Poop"} 
 
 
 
 
 
 
 
 
 { 
       
       
       
       
       
       
        Copy-Item $paths -Destination "C:\temp3\" -Recurse
        } else {
            Write-Host "File was not here"
            }