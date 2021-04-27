$taskPath = "C:\task.txt"

# 6009 - version of os when system is loading
Get-EventLog System | Where-Object {$_.EventID -contains "6009"} | Select -First 10 > $taskPath

Get-HotFix | Sort InstalledOn -Descending | Select-Object HotFixID, InstalledOn -First 5 > $taskPath 

Get-WinEvent -ListLog * | Where-Object {$_.RecordCount -AND $_.LastWriteTime -LE (Get-Date).AddDays(-1)} | 
    ForEach-Object {Get-WinEvent -LogName $_.LogName} | Group-Object -Property LevelDisplayName |
    Where-Object {"Ошибка","Предупреждение" -contains $_.Name} | Select-Object Name, Count > $taskPath 