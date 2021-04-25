$string = Read-Host "Enter ur string:" # Read-Host let you input a line in variable
if ($string.Lenght -gt 4) # -gt mean >
{
    echo "Error. Input lenght > 4"
    exit 1
}

if ($string.IndexOf("") -gt 0) # if we have a space in input
{
    echo "Error. Write a line without spaces"
    exit 2
}

$userName = "UPart3$string"
$groupName = "GPart3$string"

# Where-Object is selects objects from a collection based on their property values
# -eq mean equals (==)

$isUserExist = Get-LocalUser | Where-Object Name -eq $userName
if ($isUserExist.Count -gt 0)
{
    echo "Error. This user already exist"
    exit 3
}

echo "Creating ${userName} user"
New-LocalUser $userName -NoPassword

echo "Creating ${groupName} group"
New-LocalGroup $groupName

echo "Adding ${userName} to ${groupName} group"
Add-LocalGroupMember -Group $groupName -Member $userName

echo "Activate ${userName}"
Enable-LocalUser -Name $userName

pause