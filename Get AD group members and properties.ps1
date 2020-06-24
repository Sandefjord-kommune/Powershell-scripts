####
#Note! replace identity with group name of chosen group
####

Import-Module ActiveDirectory

Start-Sleep -Seconds 2 

Get-ADGroup -Identity "REPLACE IDENTITY WITH GROUP NAME" | Get-ADGroupMember -Recursive | Get-ADUser -Properties * | select DisplayName, Department, MobilePhone, Telephonenumber, Mail, @{Name = "Manager";Expression = {%{(Get-AdUser $_.Manager -Properties DisplayName).DisplayName}}} | Out-GridView

#Retrieves Name, Department, Mobilephone (private), Telephonenumber, Mail and managers of users in chosen group
