Get-ScheduledTask | Where-Object{$_.taskname -match "GoogleUpdater"} | Start-ScheduledTask
Get-ScheduledTask | Where-Object{$_.taskname -match "Firefox Background Update"} | Start-ScheduledTask
install-packageprovider -name nuget -force
Install-Module PsWindowsUpdate -force
Import-Module PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
pause
