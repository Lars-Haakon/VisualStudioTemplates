$templates = Get-ChildItem -Directory | Where-Object { $_.Name -ne "old"}
$templates.ForEach({
    $deletezip = ".\$_.zip"
    if (Test-Path $deletezip) {
      Remove-Item $deletezip
    }

    $compress = @{
      Path = ".\$_\*"
      CompressionLevel = "Fastest"
      DestinationPath = ".\$_.zip"
    }

    Compress-Archive @compress
})