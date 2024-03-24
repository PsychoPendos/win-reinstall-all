# Подключение сетевого диска
$networkPath = "\\truenas\TrueNAS"
$driveLetter = "T:"

New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $networkPath -Persist
