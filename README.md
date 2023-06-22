# Scan-LOLDrivers.ps1
Windows installed Drivers

I created a PowerShell LOLDriver scanner courtesy of @Oddvarmoe, @M_haggis, and IISResetMe, that can help you identify potentially malicious drivers. The script, available here, allows you to scan a specified Windows folder for any suspicious files. I recommend running the script on directories such as:

```
C:\WINDOWS\inf
C:\WINDOWS\System32\drivers
C:\WINDOWS\System32\DriverStore\FileRepository
```
This can be done by modifing line 2 in Scan-LOLDrivers.ps1. After you run the scan a log.txt file will be made with all the drivers installed in the system with the **.sys** extention. If your Computer have one of those drivers, you will see a **yes** instead of a **no**

```
Scanning C:\WINDOWS\System32 for drivers (*.sys)
Found 954 drivers
Name: win32k.sys
Path: C:\WINDOWS\System32\win32k.sys
LastWriteTime: 06/14/2023 13:10:09
LOL Driver: No
```
