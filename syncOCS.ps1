$exePath = "C:\Program Files\OCS Inventory Agent\OCSInventory.exe"
$action = New-ScheduledTaskAction -Execute $exePath
$trigger1 = New-ScheduledTaskTrigger -At 9am -Daily
$trigger2 = New-ScheduledTaskTrigger -At 12pm -Daily
$trigger3 = New-ScheduledTaskTrigger -At 3pm -Daily
$principal = New-ScheduledTaskPrincipal -UserId "Autoridade NT\SISTEMA" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger1, $trigger2, $trigger3 -TaskName "SyncOCS" -Principal $principal
