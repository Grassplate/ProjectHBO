# Define the URLs
$vagrantUrl = "https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi"
$vmwareUtilityUrl = "https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_windows_amd64.msi"

# Define the output paths
$vagrantOutput = "C:\Path\To\Save\vagrant_2.4.1_windows_amd64.msi"
$vmwareUtilityOutput = "C:\Path\To\Save\vagrant-vmware-utility_1.0.23_windows_amd64.msi"

# Download the files
Invoke-WebRequest -Uri $vagrantUrl -OutFile $vagrantOutput
Invoke-WebRequest -Uri $vmwareUtilityUrl -OutFile $vmwareUtilityOutput

Write-Host "Downloads completed!"