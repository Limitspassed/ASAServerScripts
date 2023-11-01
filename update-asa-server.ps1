# Prompt for the ARK server installation directory
$installPath = Read-Host "Enter the path where your ARK: Survival Ascended server is installed"

# Check if the ARK server path exists
if (-not (Test-Path $installPath)) {
    Write-Host "ARK server directory does not exist at $installPath. Please make sure the server is installed first."
    exit
}

# Update ARK server using the correct AppID (2430930)
$arkServerCmd = Join-Path $installPath "ShooterGame\Binaries\Win64\start.bat"

# Check if the start.bat file exists
if (-not (Test-Path $arkServerCmd)) {
    Write-Host "start.bat file does not exist. Please create it first before running this update script."
    exit
}

$forceInstallDir = "+force_install_dir $installPath"
$appUpdate = "+app_update 2430930 validate"

# Run the update command using SteamCMD
$steamCmdPath = Join-Path $installPath "steamcmd.exe"
& $steamCmdPath $forceInstallDir "+login anonymous" $appUpdate "+quit"

# Start the ARK: Survival Ascended server
Start-Process -FilePath $arkServerCmd -NoNewWindow

# Check if the ARK server process is running
$arkProcess = Get-Process -name "arkascendedserver" -ErrorAction SilentlyContinue
if ($null -ne $arkProcess) {
    Write-Host "ARK: Survival Ascended server has been updated and is running."
} else {
    Write-Host "ARK: Survival Ascended server update completed, but the server process is not running. Please check for errors."
}