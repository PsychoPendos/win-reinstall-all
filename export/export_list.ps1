# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем путь, куда сохранить список
$destinationPath = Join-Path -Path $scriptPath -ChildPath "installed-progs.json"

# Экспортируем список установленных программ
winget export -o $destinationPath
