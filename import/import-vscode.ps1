# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем имя папки и файла
$folderName = "..\\export"
$fileName = "extensions.list"

# Формируем путь к файлу
$filePath = Join-Path -Path $scriptPath -ChildPath $folderName -AdditionalChildPath $fileName

# Читаем список расширений из файла
$extensions = Get-Content $filePath

# Устанавливаем каждое расширение
foreach ($extension in $extensions) {
    code --install-extension $extension
}

# Указываем имя файла с настройками
$fileName = "settings.json"

# Указываем путь к файлу настроек VS Code
$destinationPath = "$env:APPDATA\\Roaming\\Code\\User\\settings.json"

# Копируем файл
Copy-Item -Path "$filePath" -Destination "$destinationPath" -Force
