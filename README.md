# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```pwsh
# ----------------------------
# PowerShell & Terminal Emulator Setup
# ----------------------------

# PowerShell
Start-Process -Wait winget -ArgumentList "install --id Microsoft.PowerShell -e --accept-package-agreements --accept-source-agreements"

pwsh -NoLogo -NoProfile -Command @'
# ------------------------
# DevTools Installation
# ------------------------

$devTools = @(
    "Git.Git",
    "JesseDuffield.lazygit",
    "junegunn.fzf",
    "sharkdp.fd",
    "BurntSushi.ripgrep.MSVC",
    "JernejSimoncic.Wget"
)

foreach ($tool in $devTools) {
    try {
        Start-Process -Wait winget -ArgumentList "install --id $tool -e --accept-package-agreements --accept-source-agreements"
        Write-Host "$tool installed."
    } catch {
        Write-Host "$tool installation failed: $_"
    }
}

# Terminal Emulator, Font
$terminalPackages = @(
    "DEVCOM.JetBrainsMonoNerdFont",
    "Alacritty.Alacritty"
)

foreach ($pkg in $terminalPackages) {
    try {
        Start-Process -Wait winget -ArgumentList "install --id $pkg -e --accept-package-agreements --accept-source-agreements"
        Write-Host "$pkg installed."
    } catch {
        Write-Host "$pkg installation failed: $_"
    }
}

# Clone Alacritty Settings
git clone https://github.com/Tomarun029831/AlacrittySettings "$env:APPDATA\alacritty"

# -----------------------------
# Chocolatey / LuaRocks / MinGW Installation
# -----------------------------

# Chocolatey
Start-Process -Wait winget -ArgumentList "install --id Chocolatey.Chocolatey -e --accept-package-agreements --accept-source-agreements"

# LuaRocks, MinGW on admin
Start-Process -Wait powershell -Verb RunAs -ArgumentList '-Command', @'
choco upgrade chocolatey;
choco install LuaRocks -y;
choco install mingw -y;
'@

# --------------
# Node.js Installation
# --------------

try {
    Start-Process -Wait winget -ArgumentList "install --id OpenJS.NodeJS.LTS -e --accept-package-agreements --accept-source-agreements"
    Write-Host "Node.js installed."
} catch {
    Write-Host "Node.js installation failed: $_"
}

# ----------------------
# Neovim Installation
# ----------------------

try {
    Start-Process -Wait winget -ArgumentList "install --id Neovim.Neovim -e --accept-package-agreements --accept-source-agreements"
    git clone https://github.com/Tomarun029831/NeovimSettings.git "$env:LOCALAPPDATA\nvim"
    Write-Host "Neovim and config installed."
} catch {
    Write-Host "Neovim installation failed: $_"
}

# ------------
# Complete Message
# ------------

Write-Host "Neovim Fast Setup is finished."
'@
```
