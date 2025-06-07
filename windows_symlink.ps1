# -- THIS MUST BE RUN WITH ADMIN PRIVILEGES -- #

# Creating symlinks in powershell:
#   New-Item -ItemType SymbolicLink -Path <path_to_link> -Value <path_to_target>

function CreateSymLink {
    param (
        [string]$Destination,
        [string]$Source
    )

    if(Test-Path $Destination) {
        Write-Output "$Destination already exists"
    }
    else {
        New-Item -ItemType SymbolicLink -Path $Destination -Target $Source
    }
}

# Create the symlink for profile
$source = "$HOME\.dotfiles\Microsoft.PowerShell_profile.ps1"
$destination = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

CreateSymLink -Destination $destination -Source $source

# Create symlink for neovim configuration
$source = "$HOME\.dotfiles\nvim"
$destination = "$HOME\AppData\Local\nvim"

CreateSymLink -Destination $destination -Source $source