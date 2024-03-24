$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем имя папки и файла с настройками
$folderName = "..\\export"
$fileName = "terminal-settings.json"

# Формируем путь к файлу
$filePath = Join-Path -Path $scriptPath -ChildPath $folderName -AdditionalChildPath $fileName

# Указываем путь к файлу настроек VS Code
$destinationPath = "$env:LOCALAPPDATA\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"

# Копируем файл
Copy-Item -Path "$filePath" -Destination "$destinationPath" -Force
