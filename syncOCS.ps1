$exePath = "C:\Program Files\OCS Inventory Agent\OCSInventory.exe"
$action = New-ScheduledTaskAction -Execute $exePath
$trigger1 = New-ScheduledTaskTrigger -At 9am -Daily
$trigger4 = New-ScheduledTaskTrigger -At 11am -Daily
$trigger2 = New-ScheduledTaskTrigger -At 12pm -Daily
$trigger3 = New-ScheduledTaskTrigger -At 3pm -Daily
$trigger5 = New-ScheduledTaskTrigger -At 1pm -Daily
$trigger6 = New-ScheduledTaskTrigger -At 4pm -Daily
$trigger7 = New-ScheduledTaskTrigger -At 5pm -Daily
$principal = New-ScheduledTaskPrincipal -UserId "Autoridade NT\SISTEMA" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger1, $trigger2, $trigger3, $trigger4, $trigger5, $trigger6, $trigger7 -TaskName "SyncOCS" -Principal $principal
