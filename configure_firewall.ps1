# Configure basic Windows Firewall rules
Write-Host "Configuring Windows Firewall rules..."

# Set default inbound action to block and outbound action to allow
Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block -DefaultOutboundAction Allow

# Allow specific inbound rules (for demonstration, allow HTTP traffic)
New-NetFirewallRule -DisplayName "Allow HTTP" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

Write-Host "Windows Firewall configuration completed successfully."
