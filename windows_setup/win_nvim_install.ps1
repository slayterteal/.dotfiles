# This script will install all packages in the $packages table.
#   If a listed package is undesired comment out or delete the 
#   offending package.
#
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
