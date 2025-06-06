# -- THIS MUST BE RUN WITH ADMIN PRIVILEGES -- #

# Creating symlinks in powershell:
#   New-Item -ItemType SymbolicLink -Path <path_to_link> -Value <path_to_target>

# Define source and destination
$source = "$HOME\.dotfiles\Microsoft.PowerShell_profile.ps1"
$destination = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# Create the symlink
New-Item -ItemType SymbolicLink -Path $destination -Target $source