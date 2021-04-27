try {
    $procs = Get-Process -IncludeUserName | Select-Object ID, ProcessName, Path, UserName, CPU, WS
    $procsInfo = @()
    ForEach ($proc in $procs)
    {
        $procInfo = 
        @{
            ID = $proc.ID
            ProcessName = $proc.ProcessName
            Path = $proc.Path
            UserName = $proc.UserName
            Cpu = $proc.CPU
            Ws = $proc.WS
            Time = Get-Date
        }
        $procsInfo += New-Object -TypeName PSObject -Property $procInfo
    }
    $procsInfo | Export-CSV "C:\ProcessInfo.csv" -ErrorAction Stop
    Write-EventLog -LogName ProcessMonitoringLog -Source Lab4 -EventId 1 -EntryType SuccessAudit -Message "Create info process file"
}
catch
{
    Write-EventLog -LogName ProcessMonitoringLog -Source Lab4 -EventId 2 -EntryType FailureAudit -Message "Faild writing info"
}