$NewName = "s1"

Write-Host "Name of this computer:"
$env:COMPUTERNAME

Write-Host "Renaming to ${NewName}"
Rename-Computer -NewName $NewName -Restart

