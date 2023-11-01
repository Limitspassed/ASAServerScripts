# Prompt for the SteamCMD installation directory
$steamCmdPath = Read-Host "Enter the path where you want to install SteamCMD"

# Create the directory if it doesn't exist
if (-not (Test-Path $steamCmdPath)) {
    New-Item -Path $steamCmdPath -ItemType Directory
}

# Download and extract SteamCMD
$steamCmdUrl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$steamCmdZip = Join-Path $env:TEMP "steamcmd.zip"

Invoke-WebRequest -Uri $steamCmdUrl -OutFile $steamCmdZip
Expand-Archive -Path $steamCmdZip -DestinationPath $steamCmdPath
Remove-Item -Path $steamCmdZip

Write-Host "SteamCMD has been downloaded and extracted to $steamCmdPath."

# Prompt for the ARK server installation directory
$installPath = Read-Host "Enter the path where you want to install the ARK server"

# Create the directory if it doesn't exist
if (-not (Test-Path $installPath)) {
    New-Item -Path $installPath -ItemType Directory
}

# Install or update ARK server
$arkServerCmd = Join-Path $steamCmdPath "steamcmd.exe"
$forceInstallDir = "+force_install_dir $installPath"
$appUpdate = "+app_update 2430930 validate"

& $arkServerCmd $forceInstallDir "+login anonymous" $appUpdate "+quit"

Write-Host "ARK server installed or updated in $installPath."

# Create start.bat in the Win64 folder
$startBatPath = Join-Path $installPath "ShooterGame\Binaries\Win64\start.bat"
$startBatContent = "start ArkAscendedServer.exe TheIsland_WP?listen? -UseBattlEye"
Set-Content -Path $startBatPath -Value $startBatContent

Write-Host "start.bat has been created in $startBatPath."

# You can customize the ARK server startup command here
Write-Host "You can start the ARK server with the following command:"
Write-Host "$installPath\ShooterGame\Binaries\Win64\start.bat"