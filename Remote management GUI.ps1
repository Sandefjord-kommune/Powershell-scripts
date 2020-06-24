###############################################
#Script for remote management of servers/computers, the form contains 3 functions ping, restart and shutdown. When run it will open form.
#That contains buttons for each function, that you can press if you want to ping an computer for example.
#You will be prompted for a confirm for shutdown and restart.
###############################################
function ping(){ 
    $result.text += "`r`n" + "Pinging " + $compnameTxtbox.text
    if(test-connection $compnameTxtbox.text){
        $result.text += "`r`nConnection successfull"
    }else{
         $result.text += "`r`nConnection Failed"
    }
}

function restart(){
     $Warning = [System.Windows.MessageBox]::Show('Continue?','Warning','YesNo','Error')
     if ($Warning -eq "Yes") {
          $result.text += "`r`n" +  "Shutingdown " + $compnameTxtbox.text
   Restart-Computer -ComputerName $compnameTxtbox.text -Force
     $result.text += "`r`n" + $compnameTxtbox.text + " Shutdown sucessfull"
     }else{
       $result.text += "`r`n" + $compnameTxtbox.text + " Process stopped"
       }
}

 
function shutdown(){
     $Warning = [System.Windows.MessageBox]::Show('Continue?','Warning','YesNo','Error')
     if ($Warning -eq "Yes") {
          $result.text += "`r`n" +  "Shutingdown " + $compnameTxtbox.text
   Stop-Computer -ComputerName $compnameTxtbox.text -Force
     $result.text += "`r`n" + $compnameTxtbox.text + " Shutdown sucessfull"
     }else{
       $result.text += "`r`n" + $compnameTxtbox.text + " Process stopped"
       }
}

function closeForm(){$Form.close()}
    
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '494,276'
$Form.text                       = "Simple Management"
$Form.TopMost                    = $false

$compnameTxtbox                  = New-Object system.Windows.Forms.TextBox
$compnameTxtbox.multiline        = $false
$compnameTxtbox.width            = 307
$compnameTxtbox.height           = 20
$compnameTxtbox.location         = New-Object System.Drawing.Point(163,29)
$compnameTxtbox.Font             = 'Microsoft Sans Serif,10'

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Computer name"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(29,29)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$result                          = New-Object system.Windows.Forms.TextBox
$result.multiline                = $true
$result.width                    = 303
$result.height                   = 123
$result.location                 = New-Object System.Drawing.Point(166,67)
$result.Font                     = 'Microsoft Sans Serif,10'

$pingButton                      = New-Object system.Windows.Forms.Button
$pingButton.text                 = "Ping"
$pingButton.width                = 102
$pingButton.height               = 30
$pingButton.location             = New-Object System.Drawing.Point(27,67)
$pingButton.Font                 = 'Microsoft Sans Serif,10'

$closeButton                     = New-Object system.Windows.Forms.Button
$closeButton.text                = "Close"
$closeButton.width               = 102
$closeButton.height              = 30
$closeButton.location            = New-Object System.Drawing.Point(368,213)
$closeButton.Font                = 'Microsoft Sans Serif,10'

$restartButton                   = New-Object system.Windows.Forms.Button
$restartButton.text              = "Restart"
$restartButton.width             = 102
$restartButton.height            = 30
$restartButton.location          = New-Object System.Drawing.Point(27,114)
$restartButton.Font              = 'Microsoft Sans Serif,10'

$ShutdownButton                   = New-Object system.Windows.Forms.Button
$ShutdownButton.text              = "Shutdown"
$ShutdownButton.width             = 102
$ShutdownButton.height            = 30
$ShutdownButton.location          = New-Object System.Drawing.Point(27,160)
$ShutdownButton.Font              = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($compnameTxtbox,$Label1,$result,$pingButton,$closeButton,$restartButton,$ShutdownButton))

$pingButton.Add_Click({ ping })
$restartButton.Add_Click({ restart })
$ShutdownButton.Add_Click({ shutdown })
$closeButton.Add_Click({ closeForm })
$Form.ShowDialog();

 
