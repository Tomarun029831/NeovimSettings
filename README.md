# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```powershell
# Terminal Settings
winget install --id Microsoft.PowerShell -e
pwsh
winget install --id DEVCOM.JetBrainsMonoNerdFont -e
# Terminal Emulator Settings
winget install --id wez.wezterm -e
# Tool Settings
winget install --id Git.Git -e
winget install --id JesseDuffield.lazygit -e
winget install --id junegunn.fzf -e
winget install --id sharkdp.fd -e
winget install --id BurntSushi.ripgrep.MSVC -e
winget install --id 7Zip -e
# Development Toolchain Settings
# --mingw Installation--
$zipUrl = "https://github.com/niXman/mingw-builds-binaries/releases/download/15.1.0/i686-15.1.0-release-posix-dwarf-ucrt-rt_v12-rev0.7z"
$downloadPath = "C:\mingw64\mingw.7z"
$extractTo = "C:\mingw64"
if (!(Test-Path $extractTo)) {New-Item -ItemType Directory -Path $extractTo | Out-Null}
curl -L -o $downloadPath $zipUrl
& 'C:\Program Files\7-Zip\7z.exe' x $downloadPath -o$extractTo
Remove-Item $downloadPath
$mingwBin = "$extractTo\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($currentPath -notlike "*$mingwBin*") {[Environment]::SetEnvironmentVariable("Path", "$currentPath;$mingwBin", [EnvironmentVariableTarget]::User)}
# --LuaRocks Installation--
$luaUrl = "https://sourceforge.net/projects/luabinaries/files/5.4.6/Windows%20Libraries/Static/lua-5.4.6_Win64_bin.zip/download"
$rocksUrl = "https://luarocks.org/releases/luarocks-3.9.2-windows-64.zip"
$luaZip = "$env:TEMP\lua.zip"
$rocksZip = "$env:TEMP\luarocks.zip"
$luaDir = "C:\Lua"
$rocksDir = "C:\LuaRocks"
Invoke-WebRequest -Uri $luaUrl -OutFile $luaZip -UseBasicParsing
Invoke-WebRequest -Uri $rocksUrl -OutFile $rocksZip -UseBasicParsing
Expand-Archive -Path $luaZip -DestinationPath $luaDir -Force
Expand-Archive -Path $rocksZip -DestinationPath $rocksDir -Force
$pathsToAdd = @("$luaDir", "$luaDir\bin", "$rocksDir", "$rocksDir\systree\bin")
$currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
foreach ($path in $pathsToAdd) {if ($currentPath -notlike "*$path*") {$currentPath += ";$path"}}
[Environment]::SetEnvironmentVariable("Path", $currentPath, [EnvironmentVariableTarget]::User)
# --NodeJS Installation--
winget install --id OpenJS.NodeJS.LTS -e

# Neovim Settings
winget install --id Neovim.Neovim -e
git clone https://github.com/Tomarun029831/NeovimSettings $env:LOCALAPPDATA\nvim
# To Reload ENV:PATH
exit
exit
```
