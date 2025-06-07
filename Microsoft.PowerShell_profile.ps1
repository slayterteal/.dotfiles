# Profile for Powershell
#   Similar to a .bashrc file if you're not aware...

function Get-GitBranch {
    try {
        # try to get a valid git branch name
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if($branch -and $branch -ne 'HEAD')
            {
                return " | [$branch]"
            }
    } catch {
        # no git branch found
        return ""
    }
}

# Set a custom prompt
function prompt {
    "PS $(Get-Location)$(Get-GitBranch)> "
}

# Aliases
function gitstatus {
    git status
}
Set-Alias -Name gs -Value gitstatus

# Environment variable
# $env:EDITOR = "code"

# Import modules or scripts
# . "$HOME\scripts\myscript.ps1"