
# Windows Setup

My windows specific setup. Ironically the goal is to stay away from Microsoft products as much as possible.

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

## Neovim

[Neovim README](../nvim/README.md)

> An idea to get around using Chocolatey might just be biting the bullet and using WSL

## Cygwin 

`setup-x86_64.exe` is the install tool for Cygwin. Use it to install the app, add plugins, etc.

Cygwin is a POSIX compatibility layer that provides a Unix-like environment on Windows by translating POSIX system calls into native Windows API calls through a dynamic link library (cygwin1.dll). This allows Unix-like software to be compiled into native Windows binaries, enabling integration with Windows applications and systems.

> Do not confuse Cygwin with WSL, they are not the same thing!
