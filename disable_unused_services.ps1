# Disable unused and potentially risky services
Write-Host "Disabling unused services..."

# Example: Disable Remote Registry service
Stop-Service -Name "RemoteRegistry" -Force
Set-Service -Name "RemoteRegistry" -StartupType Disabled
Write-Host "Remote Registry service has been disabled."

# Example: Disable Windows Telnet service if installed
if (Get-WindowsOptionalFeature -FeatureName TelnetClient -Online) {
    Disable-WindowsOptionalFeature -FeatureName TelnetClient -Online
    Write-Host "Telnet Client has been disabled."
} else {
    Write-Host "Telnet Client is not installed."
}

Write-Host "Unused services have been disabled successfully."
