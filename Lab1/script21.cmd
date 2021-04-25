@echo off

echo "Enter a string:"
set /p string

set userName=UPart2%string%
set groupName=GPart2%string%

net user %userName% /add

net localgroup %groupName% /add

net localgroup %groupName% %userName% /add

net user %userName% /active:yes