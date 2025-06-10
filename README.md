# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```powershell
# Terminal Settings
winget install --id Microsoft.PowerShell -e
winget install --id wez.wezterm -e
winget install --id DEVCOM.JetBrainsMonoNerdFont -e
# Git Settings
winget install --id Git.Git -e
winget install --id JesseDuffield.lazygit -e
# Process Settings
winget install --id mingw -e // TODO
winget install --id OpenJS.NodeJS.LTS -e
winget install --id Chocolatey.Chocolatey -e
powershell -Command "Start-Process pwsh -Verb RunAs -ArgumentList '-Command','choco upgrade chocolatey; choco install LuaRocks -y'"
# Tool Settings
winget install --id junegunn.fzf -e
winget install --id sharkdp.fd -e
winget install --id BurntSushi.ripgrep.MSVC -e
# Neovim Settings
winget install --id Neovim.Neovim -e
git clone https://github.com/Tomarun029831/NeovimSettings $env:LOCALAPPDATA\nvim
```
