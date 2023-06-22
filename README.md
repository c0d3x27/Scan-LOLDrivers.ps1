# Scan-LOLDrivers.ps1
Windows installed Drivers

I created a PowerShell LOLDriver scanner courtesy of @Oddvarmoe, @M_haggis, and IISResetMe, that can help you identify potentially malicious drivers. The script, available here, allows you to scan a specified Windows folder for any suspicious files. I recommend running the script on directories such as:

```
C:\WINDOWS\inf
C:\WINDOWS\System32\drivers
C:\WINDOWS\System32\DriverStore\FileRepository
```
This can be done modifing line 2 in the scanning file
