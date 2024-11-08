# Simple Windows Security Toolkit

A lightweight toolkit containing basic PowerShell scripts for improving Windows system security. 

## Scripts Overview
- **configure_firewall.ps1**: Configures basic Windows Firewall rules.
- **harden_remote_access.ps1**: Disables unnecessary remote access settings.
- **disable_unused_services.ps1**: Stops and disables commonly unused services.

## Included Executable
- **mrt.exe**: Microsoft Windows Malicious Software Removal Tool. This legitimate tool scans for and removes prevalent malware, serving as a built-in security feature.

## Quick Start

### Prerequisites
- Windows PowerShell (Run as Administrator)

### Usage
Clone this repository and navigate to the `scripts` folder:
```bash
git clone https://github.com/fakeuser/simple-win-security-toolkit.git
cd simple-win-security-toolkit/scripts
