# Add your file path to your The Witness save folder.
$path = Get-Content -Path "$PSScriptRoot\filepath"

# Clear all files inside of the save folder.
$files = Get-ChildItem -Path $path
$files.Name |
    Select-String -Pattern ".(png|witness_campaign)$" |
    Foreach-Object {
        Write-Host "`tFile Deleted: " -NoNewLine -ForegroundColor red
        Write-Host "`t$_" -ForegroundColor yellow
    }

Remove-Item -Path $path -Recurse -Include @("*.png", "*.witness_campaign")

# Reinsert all items into the save folder.
$saves = Get-ChildItem -Path "$PSScriptRoot\saves"
Foreach ($save in $saves) {
    Copy-Item "$PSScriptRoot\saves\$($save.Name)" $path
    Write-Host "`tFile Created: " -NoNewLine -ForegroundColor green
    Write-Host "`t$($save.Name)" -ForegroundColor yellow
}