$toolsPath = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
$zipPath = $(Get-ChildItem $toolsPath\x-mouse_controls*.zip | foreach { $_.FullName })
$packageArgs = @{
    PackageName  = 'x-mouse controls'
    FileFullPath = $zipPath
    Destination  = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

# Create `...exe.gui` if it does not already exist
$programPath = Join-Path $toolsPath "X-Mouse Controls.exe"
$null >> "$programPath.gui"

# Install a Start menu shortcut
$shotcutName = "X-Mouse Controls.lnk"
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $shortcutName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $programPath
