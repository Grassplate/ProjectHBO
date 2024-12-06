#Geef toestemming script met GitHub te delen (voer handmatig uit)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$Notepad = "https://www.dropbox.com/scl/fi/eda4nmxzz4qoj3sjv0zdl/npp.8.7.Installer.x64.exe?rlkey=lkqc8qsc00ncjhzner3p9f3z6&st=jmhd7ge5&dl=1"
$VMware = "https://www.dropbox.com/scl/fi/j9mn9suylmbfg088oonnx/VMware-workstation-full-17.6.1-24319023.exe?rlkey=24vkoyh6bwl7smm94eie736ly&st=gdu4f0ek&dl=1"
$NotepadDownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\npp.8.7.Installer.x64.exe'
$VMwareDownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\VMware-workstation-full-17.6.1-24319023.exe'

$vagrantUrl = 'https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi'
$vmwareUtilityUrl = 'https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_windows_amd64.msi'
$vagrantOutput = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\vagrant_2.4.1_windows_amd64.msi'
$vmwareUtilityOutput = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\vagrant-vmware-utility_1.0.23_windows_amd64.msi'

$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

#Notepad++ downloaden
Write-Host Notepad++ downloaden naar Bestanden. -ForegroundColor Cyan 
Start-Sleep 2
Invoke-WebRequest $Notepad -OutFile $NotepadDownload

#VMware downloaden
Write-Host VMware downloaden naar Bestanden. -ForegroundColor Cyan 
Start-Sleep 2
Invoke-WebRequest $VMware -OutFile $VMwareDownload



#Notepad++ installeren
Write-Host Notepad++ installatie wizzard starten. -ForegroundColor Cyan 
Start-Sleep 2
Start-Process -FilePath $NotepadDownload

#VMware installeren
Write-Host VMware installatie wizzard starten. -ForegroundColor Cyan 
Start-Sleep 2
Start-Process -FilePath $VMwareDownload

# Download the files
Write-Host Download Vagrant en VMwareUtility. -ForgroundColor Cyan
Start-Sleep 2
Invoke-WebRequest -Uri $vagrantUrl -OutFile $vagrantOutput
Invoke-WebRequest -Uri $vmwareUtilityUrl -OutFile $vmwareUtilityOutput

Write-Host Downloads completed! -ForegroundColor Cyan