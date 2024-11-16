# Define the log file path
$logFilePath = "C:\Users\patel\Downloads\Temp (To Be Deleted)\LogFile.txt"

# Disk Cleanup
$diskCleanup = @"
cleanmgr.exe /sagerun:1
"@
Write-Output "Running Disk Cleanup..." | Out-File -Append $logFilePath
Invoke-Expression $diskCleanup | Out-File -Append $logFilePath
Write-Output "Disk Cleanup completed." | Out-File -Append $logFilePath

# Clear Temp Files
$windowsTempPath = [System.IO.Path]::GetTempPath()
$localTempPath = "$env:LOCALAPPDATA\Temp"

Write-Output "Clearing Temp files in $windowsTempPath and $localTempPath..." | Out-File -Append $logFilePath
Remove-Item "$windowsTempPath*" -Recurse -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Remove-Item "$localTempPath*" -Recurse -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Write-Output "Temp files cleared." | Out-File -Append $logFilePath

# Clear Browser Cache (Example for Internet Explorer)
$ieCachePath = "$env:LOCALAPPDATA\Microsoft\Windows\INetCache"
$ieCookiesPath = "$env:LOCALAPPDATA\Microsoft\Windows\INetCookies"

Write-Output "Clearing Internet Explorer cache and cookies..." | Out-File -Append $logFilePath
Remove-Item "$ieCachePath*" -Recurse -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Remove-Item "$ieCookiesPath*" -Recurse -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Write-Output "Internet Explorer cache and cookies cleared." | Out-File -Append $logFilePath

# Clear Recycle Bin
Write-Output "Clearing Recycle Bin..." | Out-File -Append $logFilePath
Clear-RecycleBin -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Write-Output "Recycle Bin cleared." | Out-File -Append $logFilePath

# Clear Prefetch Files
$prefetchPath = "C:\Windows\Prefetch"

Write-Output "Clearing Prefetch files in $prefetchPath..." | Out-File -Append $logFilePath
Remove-Item "$prefetchPath*" -Recurse -Force -ErrorAction SilentlyContinue | Out-File -Append $logFilePath
Write-Output "Prefetch files cleared." | Out-File -Append $logFilePath