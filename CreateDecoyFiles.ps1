# Define directories to create decoy files
$directories = @(
    "$env:USERPROFILE\Desktop",
    "$env:USERPROFILE\Downloads",
    "$env:USERPROFILE\Pictures"
)

# Define file types and sample content
$fileExtensions = @(".pdf", ".txt", ".doc")
$decoyContent = @"
This is a decoy file for security testing purposes.
Do not distribute or remove without proper authorization.
"@

# Function to create decoy files
function Create-DecoyFiles {
    param (
        [string[]]$targetDirs,
        [string[]]$extensions,
        [string]$content
    )
    foreach ($dir in $targetDirs) {
        foreach ($ext in $extensions) {
            $fileName = "DecoyFile_$([System.Guid]::NewGuid())$ext"
            $filePath = Join-Path -Path $dir -ChildPath $fileName
            Write-Host "Creating decoy file: $filePath"
            Set-Content -Path $filePath -Value $content
        }
    }
}

# Create decoy files in the specified directories
Create-DecoyFiles -targetDirs $directories -extensions $fileExtensions -content $decoyContent
