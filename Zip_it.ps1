$source = "C:\Temp"

$destination = "C:\users\$env:username\Desktop\ECM_Collection.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 