# PowerShell Script to Enable "Show More Options" Right-Click Menu in Windows 11

# Define the registry path for the context menu behavior
$registryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c9053e6f4e}"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Create a new registry key that enables the "Show More Options" feature
Set-ItemProperty -Path $registryPath -Name "InprocServer32" -Value ""

# Restart Windows Explorer to apply changes
Stop-Process -Name explorer -Force

# Inform the user the script has completed
Write-Host "The 'Show more options' right-click menu has been enabled. Windows Explorer has been restarted."