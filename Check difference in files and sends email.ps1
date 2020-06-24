$OL = New-Object -ComObject outlook.application

Start-Sleep 5

$MailItem = $OL.CreateItem("OLMailItem") 

$DIR = $DirectoryInfo 
$DIR = Get-ChildItem -Path "Change path to directory that is going to be measured!" #Change path to directory that is going to be measured!
$processes_before = $DIR | Measure-Object #Counts objects before
$processes_before

Start-Sleep -Seconds 30 #Sleep to desired time currently 30 sec to register a difference in objects

$DIR = Get-ChildItem -Path "Change path to directory that is going to be measured!" #Change path to directory that is going to be measured!
$processes_afther = $DIR | Measure-Object #Counts objects afther
$processes_afther

Compare-Object -ReferenceObject $processes_before -DifferenceObject $processes_afther #Before-afther comparing objects
if($processes_before -inotin $processes_afther) 
{ 
$MailItem.to = "SET IN MAILADDRESS TO RECEIVE MAIL" #SET IN MAILADDRESS TO RECEIVE MAIL
$MailItem.Subject = "CHANGE SUBJECT IN MAIL" #CHANGE SUBJECT IN MAIL
$MailItem.Body = "CHANGE BODY IN MAIL" #CHANGE BODY IN MAIL 

$MailItem.send()

Write-Host -BackgroundColor Gray "If a difference in objects is registered before and afther mail is sent" #Writes to console
}
