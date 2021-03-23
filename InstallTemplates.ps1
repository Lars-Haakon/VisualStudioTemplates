$documentsDir = [Environment]::GetFolderPath("MyDocuments")

$VSProjectTemapltesDir = Join-Path $documentsDir "Visual Studio 2019\Templates\ProjectTemplates"

if (Test-Path $VSProjectTemapltesDir) {
    $templates = Get-ChildItem -Filter *.zip
    $templates.ForEach({
        Write-Host "Copying $_ to $VSProjectTemapltesDir"

        Copy-Item $_.Name -Destination $VSProjectTemapltesDir
    })
}