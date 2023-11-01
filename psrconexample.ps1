# Set your RCON details and replace the values with your Server IP and Server Admin password.
$serverHost = "Enter Ark Server IP or DNS" # Your ARK server IP address such as 192.168.1.200
$port = "Enter rcon port" # Your RCON port such at 27020
$password = "Enter Ark Server Admin Password" # Your RCON password which is the ark server admin password

# Define the RCON command to destroy wild dinos
$rconCommand = "SaveWorld"

# Construct the mcrcon command pointing to the mcrcon path such as the port below
$mcrconCommand = "D:\rcon\mcrcon\mcrcon.exe -H $serverHost -P $port -p $password $rconCommand"

# Execute the mcrcon command
Invoke-Expression -Command $mcrconCommand