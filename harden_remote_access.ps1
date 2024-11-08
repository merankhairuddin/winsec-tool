# Harden remote access settings
Write-Host "Hardening remote access settings..."

# Disable Remote Desktop
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
Write-Host "Remote Desktop has been disabled."

# Disable Remote Assistance
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Value 0
Write-Host "Remote Assistance has been disabled."

Write-Host "Remote access settings hardened successfully."
