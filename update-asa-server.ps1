# Prompt for the SteamCMD installation directory
$steamCmdPath = Read-Host "Enter the path where SteamCMD is installed"

# Prompt for the ARK server installation directory
$installPath = Read-Host "Enter the path where your ARK Survival Ascended server is installed"

# Check if the ARK server path exists
if (-not (Test-Path $installPath)) {
    Write-Host "ARK server directory does not exist at $installPath. Please make sure the server is installed first."
    exit
}

# Install or update ARK server using the correct AppID (2430930)
$arkServerCmd = Join-Path $steamCmdPath "steamcmd.exe"
$forceInstallDir = "+force_install_dir $installPath"
$appUpdate = "+app_update 2430930 validate"

& $arkServerCmd $forceInstallDir "+login anonymous" $appUpdate "+quit"

Write-Host "ARK Survival Ascended server has been updated in $installPath."