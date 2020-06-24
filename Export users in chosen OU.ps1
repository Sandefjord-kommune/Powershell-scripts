##########################################################
#The script retrieves your version of powershell, displays the number of OUs in the AD name of all OUs, and retrieves all users of the OUs you select in a table.
# Counts the number of users and creates a text file containing all users below C and documents on the current user.
########################################################### 

Import-Module ActiveDirectory

Start-Sleep -Seconds 3

Write-Host -BackgroundColor Blue "PowerShell version" 

$PSVersionTable.PSVersion

Write-Host -BackgroundColor Blue "Number of OU in AD" 

Get-ADOrganizationalUnit -Filter * | Measure-Object #Measure number OU in AD

Write-Host -BackgroundColor Blue "Name of OU" 

Get-ADOrganizationalUnit -Filter * | Format-Table Name #Gets name of all OU

Write-Host -BackgroundColor Blue "Choose the OU you want to see the members of" 

$OU = Get-ADOrganizationalUnit -Filter 'Name -Like "*"' | Out-GridView -OutputMode Single

Get-ADUser -Filter * -SearchBase $OU | Measure-Object #Measure numbers of users in chosen OU

Get-ADUser -Filter * -SearchBase $OU | Out-GridView #Gets users of chosen OU in a outgridview

Write-Host -BackgroundColor Blue "Number of users in OU" 

$Filsti = "$($env:USERPROFILE)\Documents\UsersinchosenOU.txt" #Path to export users

Get-ADUser -Filter * -SearchBase $OU | Out-File -FilePath $Filsti #Puts users in chosen OU to filepath $filsti

Start-Sleep -Seconds 2

Write-Host -BackgroundColor Red "Creates a text file containing the users of the OU you selected under C and documents of the current user" 
