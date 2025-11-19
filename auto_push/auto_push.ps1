# === Configuration ===
$commitMessage = "Auto-update: commit all changes"   # Default commit message

# === Move to script's folder ===
Set-Location -Path $PSScriptRoot

# === Ensure Git is initialized ===
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Git repository initialized."
}

# === Stage all files ===
git add -A

# === Commit changes ===
git commit -m "$commitMessage" 2>$null

# === Push to remote ===
try {
    git push origin main
    Write-Host "All changes pushed to GitHub successfully!"
} catch {
    Write-Host "Error pushing changes. Make sure remote 'origin' exists and branch is 'main'."
}
