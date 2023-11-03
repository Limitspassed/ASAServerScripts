# Prompt for the SteamCMD installation directory
$steamCmdPath = Read-Host "Enter the path where you want to install SteamCMD"

# Create the directory if it doesn't exist
if (-not (Test-Path $steamCmdPath)) {
    New-Item -Path $steamCmdPath -ItemType Directory
}

# Specify the path to the SteamCMD executable
$steamCmdExecutable = Join-Path $steamCmdPath "steamcmd.exe"

# Check if SteamCMD is already installed
if (Test-Path $steamCmdExecutable) {
    Write-Host "SteamCMD is already installed at $steamCmdPath."
} else {
    # If it doesn't exist, download and extract SteamCMD
    $steamCmdUrl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
    $steamCmdZip = Join-Path $env:TEMP "steamcmd.zip"

    Invoke-WebRequest -Uri $steamCmdUrl -OutFile $steamCmdZip
    Expand-Archive -Path $steamCmdZip -DestinationPath $steamCmdPath
    Remove-Item -Path $steamCmdZip

    Write-Host "SteamCMD has been downloaded and extracted to $steamCmdPath."
}

# Store the start.bat content
$startBatContent = Read-Host "Enter the start.bat content (e.g., start ArkAscendedServer.exe TheIsland_WP?listen?SessionName=ServerName?ServerAdminPassword=AdminPassword?Port=7777?QueryPort=27015?MaxPlayers=26 -UseBattlEye)"

# Prompt for the ARK server installation directory
$installPath = Read-Host "Enter the path where you want to install the ARK server"

# Check if the ARK server path already exists
if (Test-Path $installPath) {
    Write-Host "ARK server directory already exists at $installPath. Proceeding to update ARK server..."
} else {
    # If it doesn't exist, create the directory and install the ARK server
    New-Item -Path $installPath -ItemType Directory
    Write-Host "ARK server directory does not exist. Continuing to install ARK server..."
}

# Create the necessary directory structure
$gameBinPath = Join-Path $installPath "ShooterGame\Binaries\Win64"
if (-not (Test-Path $gameBinPath)) {
    New-Item -Path $gameBinPath -ItemType Directory
}

# Create start.bat in the Win64 folder
$startBatPath = Join-Path $gameBinPath "start.bat"
Set-Content -Path $startBatPath -Value $startBatContent

Write-Host "start.bat has been created in $startBatPath."

# Install or update ARK server
$arkServerCmd = Join-Path $steamCmdPath "steamcmd.exe"
$forceInstallDir = "+force_install_dir $installPath"
$appUpdate = "+app_update 2430930 validate"

& $arkServerCmd $forceInstallDir "+login anonymous" $appUpdate "+quit"

Write-Host "ARK server installed or updated in $installPath."

# You can customize the ARK server startup command here
Write-Host "You can start the ARK server with the following command:"
Write-Host "$installPath\ShooterGame\Binaries\Win64\start.bat"