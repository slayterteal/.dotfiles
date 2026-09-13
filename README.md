A personal collection of various configuration files for various different applications I use.

For Linux/Max .dotfiles expects to be in the `~/` directory.

# Fonts

- [Minecraft Font](https://github.com/IdreesInc/Monocraft)
    - Note that it does not have icons with it. If your terminal does not have a way to fallback to fonts that actually have fonts.
- [FiraCode](https://github.com/tonsky/FiraCode)

## Windows Terminal

Windows terminal has a mechanism to allow font fallback if it trys to render something the primary font does not support.

Add the fallback font after the primary in the `settings.json`.

```
{
...
"face": "Monocraft, GeistMono Nerd Font Mono"
...
}
```
