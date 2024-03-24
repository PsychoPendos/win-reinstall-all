# Указываем путь к файлу настроек Windows Terminal

$sourcePath = "$env:LOCALAPPDATA\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"

# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем путь, куда скопировать файл настроек
$destinationPath = Join-Path -Path "$scriptPath" -ChildPath "terminal-settings.json"

# Копируем файл
Copy-Item -Path $sourcePath -Destination $destinationPath

Write-Host "Файл настроек terminal скопирован в $destinationPath"
