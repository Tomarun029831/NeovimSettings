# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```powershell
winget install --id Microsoft.PowerShell -e
pwsh
# Terminal Settings
$terminalsSettings = @("DEVCOM.JetBrainsMonoNerdFont","wez.wezterm")
foreach ($terminalSetting in $terminalsSettings)
{try {winget install --id $terminalSetting -e & Write-Host "$terminalSetting installed."}
catch{Write-Host "$terminalSetting installation failed: $_"}}
# Tool Settings // FIXME: "UnZip", "7Zip", "gzip"
$tools = @("Git.Git","JesseDuffield.lazygit","junegunn.fzf","sharkdp.fd","BurntSushi.ripgrep.MSVC","JernejSimoncic.Wget")
foreach ($tool in $tools)
{try {winget install --id $tool -e & Write-Host "$tool installed."}
catch {Write-Host "$tool installation failed: $_"}}
# Development Toolchain Settings
# --MinGW Installation-- // FIXME: installation failed
try {
    $zipUrl = "https://github.com/niXman/mingw-builds-binaries/releases/download/15.1.0/i686-15.1.0-release-posix-dwarf-ucrt-rt_v12-rev0.7z"
    $downloadPath = "C:\mingw64\mingw.7z"
    $extractTo = "C:\mingw64"
    if (!(Test-Path $extractTo)) {New-Item -ItemType Directory -Path $extractTo | Out-Null}
    Invoke-WebRequest -Uri $zipUrl -OutFile $downloadPath -UseBasicParsing
    & 'C:\Program Files\7-Zip\7z.exe' x $downloadPath -o$extractTo
    Remove-Item $downloadPath
    $mingwBin = "$extractTo\bin"
    $currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
    if ($currentPath -notlike "*$mingwBin*") {[Environment]::SetEnvironmentVariable("Path", "$currentPath;$mingwBin", [EnvironmentVariableTarget]::User)}
    Write-Host "MinGW installed."
} catch {Write-Host "MinGW installation failed: $_"}
# --LuaRocks Installation-- TODO: installation on only curl
winget install --id Chocolatey.Chocolatey -e
powershell -Command "Start-Process pwsh -Verb RunAs -ArgumentList '-Command','choco upgrade chocolatey; choco install LuaRocks -y'"
# --NodeJS Installation-- // FIXME: must wait for installation
try {winget install --id OpenJS.NodeJS.LTS -e & Write-Host "Node.js installed."}
catch {Write-Host "Node.js installation failed: $_"}

# Neovim Settings
try {
    winget install --id Neovim.Neovim -e
    git clone https://github.com/Tomarun029831/NeovimSettings $env:LOCALAPPDATA\nvim
    Write-Host "Neovim and config installed."
} catch {Write-Host "Neovim installation failed: $_"}
# END
exit
exit
```
