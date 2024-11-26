#Geef toestemming script met GitHub te delen (voer handmatig uit)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Variabelen
$vmdk = "https://www.dropbox.com/scl/fi/b23m07lcqkn0k62lfs2n8/Ubuntu-Server-24.04-64bit.zip?rlkey=pym8ux2n2ojqjuuy0man7du2r&st=7mr74day&dl=1"
$vmdkdownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\Ubuntu-Server-24.04-64bit.zip'
$vmdkunzipped = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\Ubuntu Server 24.04 (64bit).vmdk'
$vmdkrenamed = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\Ubuntu-Server-24.04-64.vmdk'
$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$UbuntuServer = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\UbuntuServer.vmx"
$vmware = "C:\Program Files (x86)\VMware\VMware Workstation\"
$vmwarerun = "C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"
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
Rename-Item -Path $vmdkunzipped -NewName $vmdkrenamed


Install-Module -Name VMware.PowerCLI -Scope CurrentUser

Find-Module -Name VMware.PowerCLI

cd $vmware

.\vmcli.exe VM Create -n UbuntuServer -d $bestanden -g ubuntu-64

.\vmcli.exe ConfigParams SetEntry displayName "UbuntuServer"  $UbuntuServer

.\vmcli.exe ConfigParams SetEntry numvcpus "2" $UbuntuServer

.\vmcli.exe ConfigParams SetEntry memsize "4096" $UbuntuServer

$scsiControllerConfig = @"
scsi0.present = "TRUE"
scsi0.virtualDev = "lsisas1068"
scsi0:0.present = "TRUE"
"@

Add-Content -Path $UbuntuServer -Value $scsiControllerConfig

Write-Host "SCSI-controller configuratie is toegevoegd aan $vmxPath"


.\vmcli.exe Disk SetBackingInfo scsi0:1 disk $vmdkrenamed 1 $UbuntuServer

.\vmcli.exe Disk SetPresent scsi0:1 1 $UbuntuServer



Start-Process $vmwarerun -ArgumentList "`"$UbuntuServer`""