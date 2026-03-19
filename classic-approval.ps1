Add-Type -AssemblyName presentationCore
$mp = New-Object System.Windows.Media.MediaPlayer
$mp.Open([uri]"C:/Users/Administrator/.claude/sounds/approval/classic-sound.wav")
$mp.Play()
Start-Sleep 3