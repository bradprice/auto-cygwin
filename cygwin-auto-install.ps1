$ErrorActionPreference = 'Stop'

# Variables
$mirror = "http://mirror.vcu.edu/pub/windows/cygwin/"
$LocalDir = "$env:APPDATA\cygwin"
$InstallDir = "$env:SystemDrive\cygwin64"
$Packages = "bsdtar,make,openssh,curl,wget,svn,zip,unzip,vim,screen"

# Create C:\Temp if it doesnt already exist
$TempDir = "$env:SystemDrive\Temp"
if (!(Test-Path -Path $TempDir )) {
    New-Item -Path $TempDir -ItemType directory | Out-Null
}

# Download Latest Cygwin Setup Utility
Write-Host "==> Downloading Cygwin Setup Utility"
$CygwinURL = "https://cygwin.com/setup-x86_64.exe"
$CygwinSetup = "$TempDir/setup-x86_64.exe"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "$CygwinURL" -OutFile "$CygwinSetup"

# Install Cygwin
Write-Host "==> Installing Cygwin"
Start-Process -FilePath "$CygwinSetup" -ArgumentList `
    "--no-admin", `
    "--quiet-mode", `
    "--download", `
    "--local-install", `
    "--no-desktop", `
    "--upgrade-also", `
    "--delete-orphans", `
    "--site", "$mirror", `
    "--local-package-dir", "$LocalDir", `
    "--root", "$InstallDir", `
    "--categories", "Base", `
    "--packages", "$Packages" `
    -Wait 

# Cleanup Installation files
Write-Host "==> Cleaning Up Installation files"
Remove-Item -Path "$CygwinSetup" -Force

# Installation Complete
Write-Host "==> Installation Complete!"

#$key = & 'gpg' --decrypt "secret.gpg" --quiet --no-verbose >$null 2>&1
