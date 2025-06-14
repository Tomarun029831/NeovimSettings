# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```pwsh
# PowerShell Installation
winget install --id Microsoft.PowerShell -e --accept-package-agreements --accept-source-agreements
pwsh
# Terminal Settings
$terminalsSettings = @("DEVCOM.JetBrainsMonoNerdFont", "Alacritty.Alacritty")
foreach ($terminalSetting in $terminalsSettings) {
    try {
        Start-Process -Wait winget -ArgumentList "install --id $terminalSetting -e --accept-package-agreements --accept-source-agreements"
        Write-Host "$terminalSetting installed."
    } catch {
        Write-Host "$terminalSetting installation failed: $_"
    }
}
git clone https://github.com/Tomarun029831/AlacrittySettings $env:%APPDATA%alacritty

# Tool Settings TODO: unzip, 7zip, gzip
$tools = @("Git.Git","JesseDuffield.lazygit","junegunn.fzf","sharkdp.fd","BurntSushi.ripgrep.MSVC","JernejSimoncic.Wget")
foreach ($tool in $tools) {
    try {
        Start-Process -Wait winget -ArgumentList "install --id $tool -e --accept-package-agreements --accept-source-agreements"
        Write-Host "$tool installed."
    } catch {
        Write-Host "$tool installation failed: $_"
    }
}
# Chocolatey And LuaRocks And mingw TODO: make Installation only without choco
Start-Process -Wait winget -ArgumentList "install --id Chocolatey.Chocolatey -e --accept-package-agreements --accept-source-agreements"
Start-Process -Wait powershell -Verb RunAs -ArgumentList '-Command', 'choco upgrade chocolatey; choco install LuaRocks -y; choco install mingw -y'
# Node.js
try {
    Start-Process -Wait winget -ArgumentList "install --id OpenJS.NodeJS.LTS -e --accept-package-agreements --accept-source-agreements"
    Write-Host "Node.js installed."
} catch {
    Write-Host "Node.js installation failed: $_"
}
# Neovim Installation
try {
    Start-Process -Wait winget -ArgumentList "install --id Neovim.Neovim -e --accept-package-agreements --accept-source-agreements"
    git clone https://github.com/Tomarun029831/NeovimSettings.git $env:LOCALAPPDATA\nvim
    Write-Host "Neovim and config installed."
} catch {
    Write-Host "Neovim installation failed: $_"
}
# END of Setup
Write-Host "Neovim Fast Setup is finished."
exit
```
