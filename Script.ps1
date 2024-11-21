#Geef toestemming script met GitHub te delen (voer handmatig uit)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Variabelen
$vmdk = "https://www.dropbox.com/scl/fi/b23m07lcqkn0k62lfs2n8/Ubuntu-Server-24.04-64bit.zip?rlkey=pym8ux2n2ojqjuuy0man7du2r&st=7mr74day&dl=1"
$vmdkdownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\Ubuntu-Server-24.04-64bit.zip'
$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

#Folder 'Bestanden' aanmaken
Write-Host Folder genaamd Bestanden aanmaken. -ForegroundColor Cyan 
Start-Sleep 2
New-Item -Path $folder -Name "Bestanden" -ItemType "directory"

#Ubuntu Server.zip downloaden
Write-Host Ubuntu Server.zip downloaden naar Bestanden. Dit kan enkele minuten duren afhankelijk van de internetsnelheid. -ForegroundColor Cyan 
Start-Sleep 2
Invoke-WebRequest $vmdk -OutFile $vmdkdownload

#Ubuntu Server.zip uitpakken
Write-Host Ubuntu Server.zip uitpakken in Bestanden. -ForegroundColor Cyan 
Start-Sleep 2
Expand-Archive -LiteralPath $vmdkdownload -DestinationPath $bestanden

Install-Module -Name VMware.PowerCLI -Scope CurrentUser

New-VM -Name 'TestVM' –VMHost 'VMHost-1' -Datastore 'TestDatastore' -DiskGB 40 -MemoryGB 8 -NumCpu 2 -NetworkName 'Virtual Machine Network'
