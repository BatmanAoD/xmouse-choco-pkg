$message = @"
Uninstalling $env:ChocolateyPackageTitle DOES NOT revert X-Mouse settings;
these are persisted in Windows itself. Run the application again to modify the
behavior as desired.
"@

Write-Warning $message

# Delete the Start menu shortcut
$shortcutName = "X-Mouse Controls.lnk"
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $shortcutName 
if (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
