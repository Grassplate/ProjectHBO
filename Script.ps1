#Variabelen
$vmdk = "https://techloudgeek.com/download/image/?link=https://dlconusc1.linuxvmimages.com/046389e06777452db2ccf9a32efa3760:vmware/U/24.04/UbuntuServer_24.04_VM.7z"
$vmdkdownload = 'C:\Users\Floris-Codero\Documents\GitHub\ProjectHBO\Bestanden\UbuntuServer_24.04_VM.7z'
$folder = "C:\Users\Floris-Codero\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Floris-Codero\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

New-Item -Path $folder -Name "Bestanden" -ItemType "directory"
Invoke-WebRequest $vmdk -OutFile $vmdkdownload
Expand-Archive -LiteralPath $vmdkdownload -DestinationPath $bestanden