
# Windows Setup

My windows specific setup. Ironically the goal is to stay away from Microsoft products as much as possible.

## Important Apps to Install

- [Powershell](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows?view=powershell-7.6)
    - The best native shell I've found for windows thus far. Far better than the built-in programs at least.
    - `winget install --id Microsoft.Powershell`

## Package managers for Windows

There are several package managers on windows.

- [Chocolatey](https://chocolatey.org/install)
    - I wouldn't suggest doing this on a Work computer, several execution policies need to be updated which is something I don't think IT or SecOps would appreciate. 
- [winget](https://github.com/microsoft/winget-cli)
    - Winget is a Microsoft sponsered package manager.
- [scoop](https://scoop.sh/)
    - installs everything inside the user space
    - It's critical to run `scoop install mingw` to install the C compilers.

> Scoop actually solves many of my frustrations with trying to get a basic C compiler stood up on windows machines

## Cygwin 

`setup-x86_64.exe` is the install tool for Cygwin. Use it to install the app, add plugins, etc.

Cygwin is a POSIX compatibility layer that provides a Unix-like environment on Windows by translating POSIX system calls into native Windows API calls through a dynamic link library (cygwin1.dll). This allows Unix-like software to be compiled into native Windows binaries, enabling integration with Windows applications and systems. It is ultimately an emulation layer and comes with the normal performance impacts that entails.

# Debloat!

Windows comes prepackaged with all sorts of things we. Do. Not. Want. 

Fortunatly there is a handle tool provided [here](https://github.com/raphire/win11debloat) that will clean things up for us.
