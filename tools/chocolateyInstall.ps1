$toolsPath = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
$zipPath = $(Get-ChildItem $toolsPath\x-mouse_controls*.zip | foreach { $_.FullName })
$packageArgs = @{
    PackageName  = 'x-mouse controls'
    FileFullPath = $zipPath
    Destination  = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

# Create `...exe.gui` if it does not already exist
$null >> "$toolsPath\X-Mouse Controls.exe.gui"
