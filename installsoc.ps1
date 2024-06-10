if(Get-ScheduledTask | Where-Object{$_.taskname -match "Install_agent_SOC"}){
    break
}   
    else{

mkdir "C:\soc"

Invoke-webrequest -uri "https://github.com/Pedro-Bat/importconf/raw/main/soc.exe" -outfile "C:\soc\soc.exe"

$exePath = "C:\soc\soc.exe"
$action = New-ScheduledTaskAction -Execute $exePath
$trigger = New-ScheduledTaskTrigger -At 3pm -Daily
$trigger1 = New-ScheduledTaskTrigger -At 9am -Daily
$trigger4 = New-ScheduledTaskTrigger -At 11am -Daily
$trigger2 = New-ScheduledTaskTrigger -At 12pm -Daily
$trigger5 = New-ScheduledTaskTrigger -At 1pm -Daily
$trigger6 = New-ScheduledTaskTrigger -At 4pm -Daily
$trigger7 = New-ScheduledTaskTrigger -At 5pm -Daily 
$principal = New-ScheduledTaskPrincipal -UserId "Autoridade NT\SISTEMA" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger, $trigger1, $trigger2, $trigger4, $trigger5,$trigger6,$trigger7 -TaskName "InstallSoc_GeminaOCS" -Principal $principal

}
