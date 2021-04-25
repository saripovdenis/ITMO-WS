@echo off

set /p mode="Choose ur mode(Auto/Manual):"

if "%mode%" == "Auto" (
    netsh interface ipv4 set dns "Ethernet" dhcp
    netsh interface ipv4 set address "Ethernet" dhcp
)

if "%mode%" == "Manual" (
    netsh interface ipv4 set dns name="Ethernet" static 8.8.8.8
    netsh interface ipv4 set address name="Ethernet" static 192.168.1.10 255.255.255.0 192.168.1.1
)

pause