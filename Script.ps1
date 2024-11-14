#Variabelen
$vmdk = "https://sourceforge.net/projects/osboxes/files/v/vm/59-Uu--svr/24.04/64bit.7z/download"
$vmdkdownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\64bit.7z'
$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

New-Item -Path $folder -Name "Bestanden" -ItemType "directory"
Invoke-WebRequest $vmdk -OutFile $vmdkdownload
Expand-Archive -LiteralPath $vmdkdownload -DestinationPath $bestanden