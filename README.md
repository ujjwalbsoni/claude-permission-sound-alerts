# 🎧 Claude Code Sound Alerts

Instant audio notifications for Claude Code Permission Requests.

## ✅ Features
- 🔔 Instant sound alerts for PermissionRequest events
- 🎧 Custom MP3/WAV support
- 💻 Windows, macOS, Linux support
- ⚙️ Uses Claude Code’s hook system
- 🪶 Lightweight setup

## Youtube Video

https://youtu.be/cbVCdTyJN-c?si=IEekiC4k4O0T_qpP

## 🚀 How It Works
Claude Code emits a `PermissionRequest` event whenever it needs approval. This repository adds a hook that plays a sound through a small script.

## 📂 Repository Structure
```
/
├── sounds/
│   ├── approval/
│   │   └── approval.wav
│   └── README.md
│
├── scripts/
│   ├── play-approval.sh
│   └── play-approval.ps1
│
└── .claude-settings-file/
    └── settings.json
```

## 🛠️ Setup Instructions

### 1. Create your sounds folder
Windows:
```
C:\\Users\\<username>\\.claude\\sounds\\approval\\
```
macOS/Linux:
```
mkdir -p ~/.claude/sounds/approval
```
Place your `.wav` or `.mp3` file in the folder.

### 2. Install the sound script

#### Windows (PowerShell)
Create:
```
C:\\Users\\<username>\\.claude\\sounds\\play-approval.ps1
```
Content:
```powershell
Add-Type -AssemblyName presentationCore
$mp = New-Object System.Windows.Media.MediaPlayer
$mp.Open([uri]"C:/Users/<username>/.claude/sounds/approval/approval.wav")
$mp.Play()
Start-Sleep 3
```

#### macOS/Linux
Create:
```
~/.claude/sounds/play-approval.sh
```
Add:
```bash
#!/bin/bash
afplay ~/.claude/sounds/approval/approval.wav
```
Make executable:
```
chmod +x ~/.claude/sounds/play-approval.sh
```

### 3. Add the hook configuration
Windows (`settings.json`):
```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "powershell.exe -File C:/Users/<username>/.claude/sounds/play-approval.ps1"
          }
        ]
      }
    ]
  }
}
```

macOS/Linux:
```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/sounds/play-approval.sh"
          }
        ]
      }
    ]
  }
}
```

## 🔍 Troubleshooting
- Ensure file paths use forward slashes on Windows
- Check audio file plays normally
- Make sure script is executable on macOS/Linux

## 📜 License
MIT License

## 🙌 Contributions
PRs welcome—new scripts, sound packs, hook improvements.
