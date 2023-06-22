$lolDriversUri = 'https://www.loldrivers.io/api/drivers.json'
$scanPath = "$env:windir\System32"

$logFilePath = Join-Path -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -ChildPath 'log.txt'

"Fetching loldriver list as json from $lolDriversUri" | Out-File -FilePath $logFilePath -Append
try {
    $response = Invoke-RestMethod -Uri $lolDriversUri
    "Obtained driver list from loldrivers.io, count is $($response.Count)" | Out-File -FilePath $logFilePath -Append
} catch {
    "Error fetching driver list: $_" | Out-File -FilePath $logFilePath -Append
    return
}

"Scanning $scanPath for drivers (*.sys)" | Out-File -FilePath $logFilePath -Append
$driverList = Get-ChildItem -Path $scanPath -Recurse -Filter "*.sys" -ErrorAction SilentlyContinue
"Found $($driverList.Count) drivers" | Out-File -FilePath $logFilePath -Append

ForEach ($driver in $driverList)
{
    $driverInfo = "Name: $($driver.Name)`nPath: $($driver.FullName)`nLastWriteTime: $($driver.LastWriteTime)`n"
    if ($response -and $response.name -and $response.name.Contains($driver.Name))
    {
        $driverInfo += "LOL Driver: Yes`n"
    } else {
        $driverInfo += "LOL Driver: No`n"
    }
    $driverInfo | Out-File -FilePath $logFilePath -Append
}
