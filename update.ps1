Get-ScheduledTask | Where-Object{$_.taskname -match "GoogleUpdater"} | Start-ScheduledTask
Get-ScheduledTask | Where-Object{$_.taskname -match "Firefox Background Update"} | Start-ScheduledTask
