# Profile for Powershell
#   Similar to a .bashrc file if you're not aware...

function Get-GitBranch {
    try {
        # try to get a valid git branch name
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if($branch -and $branch -ne 'HEAD')
            {
                return "$branch"
            }
    } catch {
        # no git branch found
        return ""
    }
}

# Set a custom prompt
function prompt {
    $currentDir = Get-Location
    $branch = Get-GitBranch

    Write-Host "$currentDir" -NoNewLine -ForegroundColor Cyan
    if($branch) {
        Write-Host " | [" -NoNewLine
        Write-Host "$branch" -NoNewLine -ForegroundColor Green
        Write-Host "]" -NoNewLine
    }
    return "> "
}

# Aliases

# git status
function gitstatus {
    git status
}
Set-Alias -Name gs -Value gitstatus

# Push commits to branch
# will prompt for confirmation
function GitPushOrigin {
    $branch = git rev-parse --abbrev-ref HEAD 2>$null
    
    if(-not $branch) {
        Write-Host "⚠️ Not inside a Git repository." -ForegroundColor Red
        return
    } 
    
    $confirmation = Read-Host "Push to '$branch'? [Y/N]"

    if( $confirmation -match '^[Yy]$') {
        # push commits to origin
        git push origin $branch
        Write-Host "✅ Pushed to '$branch'" -ForegroundColor Green
    } else {
        Write-Host "❌ Push cancelled." -ForegroundColor Yellow
    }
}
Set-Alias -Name gpo -Value GitPushOrigin

# Environment variable
# $env:EDITOR = "code"

# Import modules or scripts
# . "$HOME\scripts\myscript.ps1"