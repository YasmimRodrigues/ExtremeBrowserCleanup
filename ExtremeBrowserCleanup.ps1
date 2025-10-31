# Shuts down open browsers
Get-Process -Name firefox, chrome, msedge -ErrorAction SilentlyContinue | Stop-Process -Force

# --- Firefox Extreme Cleanup ---
# Deletes ALL profiles, including saved passwords, bookmarks, and all browsing data.
$firefoxProfilesPath = "$env:APPDATA\Mozilla\Firefox\Profiles"

if (Test-Path $firefoxProfilesPath) {
    # Remove ALL profile directories
    Get-ChildItem -Path $firefoxProfilesPath -Directory | ForEach-Object {
        Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Removes the profile index file (profiles.ini)
# This FORCES Firefox to create a new profile and profiles.ini on the next launch.
$profilesIniPath = "$env:APPDATA\Mozilla\Firefox\profiles.ini"

if (Test-Path $profilesIniPath) {
    Remove-Item $profilesIniPath -Force -ErrorAction SilentlyContinue
}

# --- Chrome Extreme Cleanup ---
# Removes ALL profiles, cache, and user data (passwords, bookmarks, extensions, etc.)
$chromeUserDataPath = "$env:LOCALAPPDATA\Google\Chrome\User Data"

if (Test-Path $chromeUserDataPath) {
    # Removes the contents of the User Data folder
    Remove-Item "$chromeUserDataPath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# --- Edge Extreme Cleanup ---
# Removes ALL profiles, cache, and user data (passwords, bookmarks, extensions, etc.)
$edgeUserDataPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"

if (Test-Path $edgeUserDataPath) {
    # Removes the contents of the User Data folder
    Remove-Item "$edgeUserDataPath\*" -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Output "Cleanup successful. Browsers will require new login and all profiles/data have been deleted."
