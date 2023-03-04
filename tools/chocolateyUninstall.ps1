$message = @"
Uninstalling $env:ChocolateyPackageTitle DOES NOT revert X-Mouse settings;
these are persisted in Windows itself. Run the application again to modify the
behavior as desired.
"@

Write-Warning $message

# No further action is required. The unzipped files will be deleted
# automatically.
