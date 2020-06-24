#script for import and export of users from and too AD

Import-Module ActiveDirectory

$CSVFile = "CHANGE PATH TO PATH FOR CSV WITH USERS"

$users = Import-Csv  -Path $CSVFile

$Chosenusers = $users | Out-GridView -OutputMode Multiple -Title "Choose users you want to import from CSV"

$OU = Get-ADOrganizationalUnit -Filter{name  -like '*'}  | Out-GridView -OutputMode Single -Title "What OU will the users be imported too?"

foreach($user in $valgteusers)

{

    New-ADUser -Name ($user.GivenName + " "  + $User.SurName) -GivenName $user.GivenName -Surname $User.SurName -SamAccountName $User.SAMAccountName -UserPrincipalName  $User.UserPrincipalName  -Path $OU -WhatIf

    Write-host "User created" -ForegroundColor Green

}

 

#How to export from AD is under here

#$users = get-aduser -Filter{name -like '*'} -SearchBase $OU -Properties mail, GivenName, SurName, SAMAccountName, UserPrincipalName | select mail, GivenName, SurName, SAMAccountName, UserPrincipalName -First 5

#$users | Export-Csv $CSVFile 

#Start-Process -FilePath $CSVFile
