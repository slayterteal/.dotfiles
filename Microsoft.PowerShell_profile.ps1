# Profile for Powershell
#   Similar to a .bashrc file if you're not aware...

# Set a custom prompt
# function prompt {
#     "PS $(Get-Location)> "
# }

# Aliases
function gitstatus {
    git status
}
Set-Alias -Name gs -Value gitstatus

# Environment variable
# $env:EDITOR = "code"

# Import modules or scripts
# . "$HOME\scripts\myscript.ps1"