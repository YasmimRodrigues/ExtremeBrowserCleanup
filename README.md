# 🗑️ Extreme Browser Cleanup and Total Reset (PowerShell)

**ExtremeBrowserCleanup.ps1** is a PowerShell script designed to perform a **deep and complete cleanup** across multiple web browsers, removing **all user data, profiles, and configuration settings**.  
It functions as a full **“factory reset”** for supported browsers.

---

## 🌐 Supported Browsers

- **Mozilla Firefox**  
- **Google Chrome**  
- **Microsoft Edge**

---

## ⚠️ CRITICAL WARNING: TOTAL DATA LOSS

> ⚠️ **Attention:** This script performs an *irreversible* deletion of all browser data.  
> After execution, all browsers will behave as if freshly installed.

It **permanently deletes**:

- All user profiles  
- All saved bookmarks  
- All saved passwords  
- All browsing history and cookies  
- All extensions and custom settings  

Use **with extreme caution!**

---

## 💻 How to Use

### 🔧 Requirements

- **Windows** operating system  
- **PowerShell** installed  

---

### ▶️ Execution

1. **Download** the file `ExtremeBrowserCleanup.ps1`  
2. **Open PowerShell as Administrator** (recommended to ensure full permissions)  
3. **Navigate** to the folder where the file is saved  
4. **Run the script** using the command below:

   ```powershell
   .\ExtremeBrowserCleanup.ps1
   
---

## ⚙️ Technical Details

The script operates in three main stages:

1️⃣ Forceful Browser Closure

Ensures no browser process is locking files before deletion.

```
Get-Process -Name firefox, chrome, msedge -ErrorAction SilentlyContinue | Stop-Process -Force
```
2️⃣ Firefox Extreme Cleanup

Locates all profile folders under:

```
$env:APPDATA\Mozilla\Firefox\Profiles
```

Deletes all profile folders (including cache, history, and bookmarks)

Removes the profiles.ini file to force Firefox to create a new profile on next startup, preventing the “Profile Missing” error

3️⃣ Chrome and Edge Extreme Cleanup

For Chromium-based browsers, all user data is stored under User Data folders.
The script deletes the entire contents of these directories:

```
$env:LOCALAPPDATA\Google\Chrome\User Data
$env:LOCALAPPDATA\Microsoft\Edge\User Data
```

This includes:

- Passwords
- Bookmarks
- Extensions
- Cookies
- Preferences
- Cache

---

## 🧩 Expected Result

After running the script, all browsers will start as if newly installed, with no previous user data or configurations remaining.
