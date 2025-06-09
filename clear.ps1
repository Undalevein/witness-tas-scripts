# Add your file path to your The Witness save folder.
$path = ""

$files = Get-ChildItem -Path $path
$files.Name |
    Select-String -Pattern ".(png|witness_campaign)$" |
    Foreach-Object {
        Write-Host "`tFile Deleted: " -NoNewLine -ForegroundColor red
        Write-Host "`t$_" -ForegroundColor yellow
    }

Remove-Item -Path $path -Recurse -Include @("*.png", "*.witness_campaign")