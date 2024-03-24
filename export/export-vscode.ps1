# Указываем путь к файлу настроек VS Code
$sourcePath = "$env:APPDATA\Code\User\settings.json"

# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем путь, куда скопировать файл настроек
$destinationPath = Join-Path -Path "$scriptPath" -ChildPath "code-settings.json"

# Копируем файл
Copy-Item -Path $sourcePath -Destination $destinationPath

# Указываем путь, куда сохранить список расширений
$destinationPath = Join-Path -Path $scriptPath -ChildPath "code-extensions.list"

# Экспортируем список установленных расширений
code --list-extensions > "$destinationPath"
