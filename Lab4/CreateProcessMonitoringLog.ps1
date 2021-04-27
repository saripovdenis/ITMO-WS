try {
    New-EventLog -LogName ProcessMonitoringLog -Source Lab4 -ErrorAction Stop
}
catch {
    Write-Host "Error. This log already exist"
}