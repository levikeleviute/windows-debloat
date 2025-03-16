# Windows 11 De-Bloat Script
# Futtatás rendszergazdaként!

# Nyomkövetés és Telemetria letiltása
Write-Host "Nyomkövetés és telemetria kikapcsolása..." -ForegroundColor Yellow
$services = @("DiagTrack", "dmwappushservice", "SysMain")
foreach ($service in $services) {
    Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
    Set-Service -Name $service -StartupType Disabled
}

# Alkalmazások eltávolítása
Write-Host "Felesleges alkalmazások eltávolítása..." -ForegroundColor Yellow
$apps = @("Microsoft.XboxGameOverlay", "Microsoft.YourPhone", "Microsoft.BingWeather")
foreach ($app in $apps) {
    Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "De-Bloat kész! Indítsd újra a rendszert!" -ForegroundColor Green
