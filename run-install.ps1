$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Получаем ID группы администраторов
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

# Проверяем, запущен ли скрипт от имени администратора
if ($myWindowsPrincipal.IsInRole($adminRole))
{
   # Скрипт уже запущен от имени администратора
   Write-Host "Скрипт запущен от имени администратора"
}
else
{
   # Скрипт не запущен от имени администратора, перезапускаем его
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}

winget source add --name MyRepo --arg \\\\myNetworkDrive\\path\\to\\repo

# Получаем путь к папке, где находится текущий скрипт
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Указываем имя папки
$folderName = "import"

# Формируем путь к папке со скриптами
$scriptsFolderPath = Join-Path -Path $scriptPath -ChildPath $folderName

# Получаем список всех файлов .ps1 в папке
$scripts = Get-ChildItem -Path $scriptsFolderPath -Filter *.ps1

# Запускаем каждый скрипт
foreach ($script in $scripts) {
    & "$script.FullName"
}
