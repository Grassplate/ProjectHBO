#Geef toestemming script met GitHub te delen (voer handmatig uit)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$Notepad++ = "https://www.dropbox.com/scl/fi/eda4nmxzz4qoj3sjv0zdl/npp.8.7.Installer.x64.exe?rlkey=lkqc8qsc00ncjhzner3p9f3z6&st=jmhd7ge5&dl=1"
$VMware = "https://www.dropbox.com/scl/fi/j9mn9suylmbfg088oonnx/VMware-workstation-full-17.6.1-24319023.exe?rlkey=24vkoyh6bwl7smm94eie736ly&st=gdu4f0ek&dl=1"
$Notepad++Download = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\npp.8.7.Installer.x64.exe'
$VMwareDownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\VMware-workstation-full-17.6.1-24319023.exe'

$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

Start-Sleep 2
Invoke-WebRequest $Notepad++ -OutFile $Notepad++Download
Invoke-WebRequest $VMware -OutFile $VMwareDownload

Start-Process -FilePath $Notepad++Download
Start-Process -FilePath $VMwareDownload
