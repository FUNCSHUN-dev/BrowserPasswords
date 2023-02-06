# Define the path to the PowerShell 7 executable
$pwshExePath = "C:\Program Files\PowerShell\7\pwsh.exe"

# Check if PowerShell 7 is already installed
if (Test-Path $pwshExePath)
{
    Write-Host "PowerShell 7 is already installed."
}
else
{
    # Define the URL for downloading PowerShell 7
    $url = "https://github.com/PowerShell/PowerShell/releases/download/v7.3.2/PowerShell-7.3.2-win-x64.zip"

    # Define the file path to save the downloaded file
    $filePath = "$env:TEMP\PowerShell-7.3.2-win-x64.zip"

    # Download the PowerShell 7 ZIP file
    Invoke-WebRequest -Uri $url -OutFile $filePath

    # Extract the ZIP file to the temp folder
    Expand-Archive -Path $filePath -DestinationPath "$env:TEMP"

    # Define the path to the MSI file
    $msiFilePath = "$env:TEMP\PowerShell-7.3.2-win-x64.msi"

    # Define the arguments for the msiexec command
    $arguments = "/package `"$msiFilePath`" /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1"

    # Install PowerShell 7 using msiexec
    Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait
}
