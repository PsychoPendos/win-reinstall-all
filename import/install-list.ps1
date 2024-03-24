# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем имя папки и файла
$folderName = "..\\export"
$fileName = "installed-progs.json"

# Формируем путь к файлу
$filePath = Join-Path -Path $scriptPath -ChildPath $folderName -AdditionalChildPath $fileName

# Импорт и установка программ из файла JSON
winget import -i "$filePath" -h --accept-package-agreements
