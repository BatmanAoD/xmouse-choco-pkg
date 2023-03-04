$toolsPath = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
$zipPath = $(Get-ChildItem $toolsPath\x-mouse_controls*.zip | foreach { $_.FullName })
$packageArgs = @{
    PackageName  = 'x-mouse controls'
    FileFullPath = $zipPath
    Destination  = $toolsPath
}

# XXX TEMP
Write-Warning ($packageArgs | Out-String)

Get-ChocolateyUnzip @packageArgs

New-Item -ItemType file "$toolsPath\X-Mouse Controls.exe.gui"
