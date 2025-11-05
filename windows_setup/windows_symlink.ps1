# -- THIS MUST BE RUN WITH ADMIN PRIVILEGES -- #

# Creating symlinks in powershell:
#   New-Item -ItemType SymbolicLink -Path <path_to_link> -Value <path_to_target>

function CreateSymLink {
    param (
        [string]$Destination,
        [string]$Source
    )

    # if the symlink file already exists, delete it
    if(Test-Path $Destination) {
        Write-Output "$Destination already exists, removing..."
        Remove-Item $Destination
    }

    # create the new symlink
    Write-Output "Symlink created at: $Destination"
    New-Item -ItemType SymbolicLink -Path $Destination -Target $Source
}

# ! This could be moved to a table and iterated over
$winSourceDir = "$HOME\.dotfiles\windows_setup"

# Create the symlink for profile
$source = "$winSourceDir\Microsoft.PowerShell_profile.ps1"
$destination = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

CreateSymLink -Destination $destination -Source $source

# Create symlink for neovim configuration (which isn't in the windows source dir)
$source = "$HOME\.dotfiles\nvim"
$destination = "$HOME\AppData\Local\nvim"

CreateSymLink -Destination $destination -Source $source

# Create symlink for VSCode User Settings.json and keybindings.json

$source = "$HOME\.dotfiles\vscode\settings.json"
$destination = "$HOME\AppData\Roaming\Code\User\settings.json" 

CreateSymLink -Destination $destination -Source $source

$source = "$HOME\.dotfiles\vscode\keybindings.json"
$destination = "$HOME\AppData\Roaming\Code\User\keybindings.json" 

CreateSymLink -Destination $destination -Source $source

# Cannot symlink powershell settings?
# NOTE: this can break after updates!
# $source = "$sourceDir\terminal\settings.json"
# $destination = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" 

# CreateSymLink -Destination $destination -Source $source