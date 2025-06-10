# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```powershell
# Terminal Settings
$terminalsSettings = @(
    "Microsoft.PowerShell",
    "DEVCOM.JetBrainsMonoNerdFont",
    "wez.wezterm"
)
foreach ($terminalSetting in $terminalsSettings) {
    try {
        winget install --id $terminalSetting -e
        Write-Host "$terminalSetting installed."
    } catch {
        Write-Host "$terminalSetting installation failed: $_"
    }
}

# Tool Settings
$tools = @(
    "Git.Git",
    "JesseDuffield.lazygit",
    "junegunn.fzf",
    "sharkdp.fd",
    "BurntSushi.ripgrep.MSVC",
    "7Zip"
)
foreach ($tool in $tools) {
    try {
        winget install --id $tool -e
        Write-Host "$tool installed."
    } catch {
        Write-Host "$tool installation failed: $_"
    }
}

# Development Toolchain Settings
# --MinGW Installation--
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
    if ($currentPath -notlike "*$mingwBin*") {
        [Environment]::SetEnvironmentVariable("Path", "$currentPath;$mingwBin", [EnvironmentVariableTarget]::User)
    }
    Write-Host "MinGW installed."
} catch {
    Write-Host "MinGW installation failed: $_"
}

# --LuaRocks Installation--
try {
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
    foreach ($path in $pathsToAdd) {
        if ($currentPath -notlike "*$path*") {
            $currentPath += ";$path"
        }
    }
    [Environment]::SetEnvironmentVariable("Path", $currentPath, [EnvironmentVariableTarget]::User)
    Write-Host "Lua and LuaRocks installed."
} catch {
    Write-Host "LuaRocks installation failed: $_"
}
# --NodeJS Installation--
try {
    winget install --id OpenJS.NodeJS.LTS -e
    Write-Host "Node.js installed."
} catch {
    Write-Host "Node.js installation failed: $_"
}

# Neovim Settings
try {
    winget install --id Neovim.Neovim -e
    git clone https://github.com/Tomarun029831/NeovimSettings $env:LOCALAPPDATA\nvim
    Write-Host "Neovim and config installed."
} catch {
    Write-Host "Neovim installation failed: $_"
}

# END
exit
exit
```
