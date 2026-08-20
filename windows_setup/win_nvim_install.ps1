# This script will install all packages in the $packages table.
#   If a listed package is undesired comment out or delete the 
#   offending package.

# --- Helper: install a winget package by exact ID, skip if already present --
function Install-WingetPackage {
    param(
        [Parameter(Mandatory)][string]$Id,
        [string]$Name = $Id
    )
 
    $installed = winget list --id $Id -e --accept-source-agreements 2>$null | Select-String -SimpleMatch $Id
 
    if ($installed) {
        Write-Host "[skip] $Name already installed." -ForegroundColor Yellow
        return
    }
 
    Write-Host "[install] $Name ($Id)..." -ForegroundColor Cyan
    winget install --id $Id -e --silent --accept-source-agreements --accept-package-agreements
 
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "$Name failed to install (exit code $LASTEXITCODE). Continuing with remaining packages."
    }
}

# Format: WingetId, DisplayName
$packages = @(
    @{ Id = "Neovim.Neovim";              Name = "Neovim" }
    @{ Id = "Git.Git";                    Name = "Git" }
    @{ Id = "BurntSushi.ripgrep.MSVC";    Name = "ripgrep" }
    @{ Id = "sharkdp.fd";                 Name = "fd" }
    @{ Id = "junegunn.fzf";               Name = "fzf" }
    @{ Id = "zig.zig";                    Name = "Zig (C compiler for treesitter parsers)" } 
    @{ Id = "equalsraf.win32yank";        Name = "win32yank (clipboard support)" }
    # TODO missing LazyGit
)
 
Write-Host "`nInstalling Neovim and dependencies via winget...`n" -ForegroundColor Green
 
foreach ($pkg in $packages) {
    Install-WingetPackage -Id $pkg.Id -Name $pkg.Name
}
