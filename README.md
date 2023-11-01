# ASAServerScripts

# ARK: Survival Ascended Server Setup Script

This PowerShell script automates the process of setting up an ARK: Survival Ascended server using SteamCMD on Windows. It allows you to download SteamCMD, install or update the ARK: Survival Ascended server, and create a `start.bat` file for launching the server.

## Prerequisites

- Windows operating system
- PowerShell (Ensure `Set-ExecutionPolicy` is set to `Unrestricted` for script execution)
- Internet connection for downloading SteamCMD and server files

## Instructions

1. **Clone or Download:** Download or clone this repository to your local machine.

2. **Set Execution Policy:**

   Before running the script, make sure your PowerShell execution policy is set to `Unrestricted`. You can do this by running PowerShell as an administrator and executing the following command:

   ```powershell
   Set-ExecutionPolicy Unrestricted
This is required to run scripts that are not digitally signed.

Run the Script:

Open a PowerShell terminal and navigate to the directory where the script is located. Run the script by executing:

.\setup-ark-ascended-server.ps1
Follow Prompts:

You will be prompted to enter the path where you want to install SteamCMD. If SteamCMD is already installed at the specified path, it will not be re-downloaded.
Next, you will be prompted to enter the path where you want to install the ARK: Survival Ascended server. If the directory does not exist, it will be created.
The script will download SteamCMD (if needed), install or update the ARK: Survival Ascended server, and create a start.bat file in the Win64 folder for server startup.
Start the ARK: Survival Ascended Server:

After the script completes, you can start the ARK: Survival Ascended server by executing the start.bat file located in the Win64 folder within your installation directory.

For example:

cd C:\ARKServer\ShooterGame\Binaries\Win64
start.bat
Customization:

You can customize the start.bat file with additional server startup options as needed.

Disclaimer
This script is provided as a convenience for setting up an ARK: Survival Ascended server. It relies on external tools like SteamCMD and assumes a basic server setup. You may need to configure server settings and additional features separately.

License
This script is provided under the MIT License. Feel free to modify and adapt it for your own use.

Please replace `"setup-asa-server.ps1"` with the actual name of your PowerShell script for setting up the Ark Survival Ascended server if it's different.
