$mode = Read-Host "Choose ur mode"

if ($mode -eq "Auto") {
    Set-NetIPInterface -InterfaceAlias Ethernet -Dhcp Enabled
    Set-DnsClientServerAddress -InterfaceAlias Ethernet -ResetServerAddresses
}
elseif ($mode -eq "Manual") {
    Remove-NetRoute -InterfaceAlias Ethernet
    New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.1.10 -PrefixLength 24 -DefaultGateway 192.168.1.1
    Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 8.8.8.8
}
else {
    echo "Error. Wrong input"
    exit 1
}

pause