# ARK: Survival Ascended Server Setup Script

This PowerShell script automates the process of setting up an ARK: Survival Ascended server using SteamCMD on Windows. It allows you to download SteamCMD, install or update the ARK: Survival Ascended server, and create a start.bat file for launching the server.

## Prerequisites

- Windows operating system
- PowerShell (Ensure Set-ExecutionPolicy is set to Unrestricted for script execution)
- Internet connection for downloading SteamCMD and server files

## Instructions

### Clone or Download:

Download or clone this repository to your local machine.

### Set Execution Policy:

Before running the script, make sure your PowerShell execution policy is set to Unrestricted. You can do this by running PowerShell as an administrator and executing the following command:

```powershell
Set-ExecutionPolicy Unrestricted
This is required to run scripts that are not digitally signed.

Run the Script:
Open a PowerShell terminal and navigate to the directory where the script is located. Run the script by executing:

.\setup-ark-ascended-server.ps1
Follow Prompts:
You will be prompted to enter the path where you want to install SteamCMD. If SteamCMD is already installed at the specified path, it will not be re-downloaded. Next, you will be prompted to enter the path where you want to install the ARK: Survival Ascended server. If the directory does not exist, it will be created. The script will download SteamCMD (if needed), install or update the ARK: Survival Ascended server, and create a start.bat file in the Win64 folder for server startup.

Start the ARK: Survival Ascended Server:
After the script completes, you can start the ARK: Survival Ascended server by executing the start.bat file located in the Win64 folder within your installation directory.

For example:

cd C:\ARKServer\ShooterGame\Binaries\Win64
start.bat
Customization:
You can customize the start.bat file with additional server startup options as needed.

ARK: Survival Ascended Server Update Script
This script is used to update an existing ARK: Survival Ascended server. It assumes that SteamCMD and the server files are already installed.

To use the update script, follow the same instructions as above for setting the execution policy, then run the script:

.\update-ark-ascended-server.ps1
You will be prompted to enter the path where the ARK: Survival Ascended server is installed. The script will update the server using AppID 2430930.

Running RCON Commands Example
This example script demonstrates how to execute RCON commands on your ARK: Survival Ascended server using mcrcon.

Prerequisites
mcrcon - A command-line RCON client for ARK server administration.

# Set your RCON details and replace the values with your Server IP, RCON port, and Server Admin password.
$serverHost = "Enter Ark Server IP or DNS" # Your ARK server IP address such as 192.168.1.200
$port = "Enter RCON port" # Your RCON port such as 27020
$password = "Enter Ark Server Admin Password" # Your RCON password (ARK server admin password)

# Define the RCON command you want to execute (e.g., "SaveWorld").
$rconCommand = "SaveWorld"

# Construct the mcrcon command pointing to the mcrcon path such as the port below
$mcrconCommand = "D:\rcon\mcrcon\mcrcon.exe -H $serverHost -P $port -p $password $rconCommand"

# Execute the mcrcon command
Invoke-Expression -Command $mcrconCommand
Feel free to modify and adapt these scripts for your own use.

License
This script is provided under the MIT License.

Please replace "setup-asa-server.ps1" with the actual name of your PowerShell script for setting up the ARK: Survival Ascended server if it's different.