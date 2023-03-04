$toolsPath = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
$zipPath = $(dir -Name $toolsPath\x-mouse_controls*.zip)
$packageArgs = @{
    PackageName  = 'x-mouse controls'
    FileFullPath = $zipPath
    Destination  = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

New-Item -ItemType file "$toolsPath\X-Mouse Controls.exe.gui"
