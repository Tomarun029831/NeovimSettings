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
# MinGW Installation FIXME: Failed Installation
try {
    $zipUrl = "https://github.com/niXman/mingw-builds-binaries/releases/download/15.1.0/i686-15.1.0-release-posix-dwarf-ucrt-rt_v12-rev0.7z"
    $downloadPath = "C:\mingw64\mingw.7z"
    $extractTo = "C:\mingw64"
    if (!(Test-Path $extractTo)) { New-Item -ItemType Directory -Path $extractTo | Out-Null }
    Invoke-WebRequest -Uri $zipUrl -OutFile $downloadPath -UseBasicParsing

    Start-Process -Wait "C:\Program Files\7-Zip\7z.exe" -ArgumentList "x `"$downloadPath`" -o`"$extractTo`""
    Remove-Item $downloadPath

    $mingwBin = "$extractTo\bin"
    $currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
    if ($currentPath -notlike "*$mingwBin*") {
        [Environment]::SetEnvironmentVariable("Path", "$currentPath;$mingwBin", [EnvironmentVariableTarget]::User)
    }
    Write-Host "MinGW installed."
} catch {
    Write-Host "MinGW installation failed: $_"
}
# Chocolatey And LuaRocks TODO: make Installation only with curl or wget
Start-Process -Wait winget -ArgumentList "install --id Chocolatey.Chocolatey -e --accept-package-agreements --accept-source-agreements"
Start-Process -Wait powershell -Verb RunAs -ArgumentList '-Command', 'choco upgrade chocolatey; choco install LuaRocks -y'
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
