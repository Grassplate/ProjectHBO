#Geef toestemming script met GitHub te delen (voer handmatig uit)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$np = "https://www.dropbox.com/scl/fi/eda4nmxzz4qoj3sjv0zdl/npp.8.7.Installer.x64.exe?rlkey=lkqc8qsc00ncjhzner3p9f3z6&st=jmhd7ge5&dl=1"
$vm = "https://www.dropbox.com/scl/fi/j9mn9suylmbfg088oonnx/VMware-workstation-full-17.6.1-24319023.exe?rlkey=24vkoyh6bwl7smm94eie736ly&st=gdu4f0ek&dl=1"
$npdownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\npp.8.7.Installer.x64.exe'
$vmdownload = 'C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden\VMware-workstation-full-17.6.1-24319023.exe'

$folder = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO"
$bestanden = "C:\Users\Codero Admin\Documents\GitHub\ProjectHBO\Bestanden"
$Variable = Get-Variable
Clear-Host

Start-Sleep 2
invoke-WebRequest $np -OutFile $npdownload
invoke-WebRequest $vm -OutFile $vmdownload

Start-Process -FilePath $npdownload
Start-Process -FilePath $vmdownload