Install-WindowsFeature -name AD-Domain-Services,DNS -IncludeManagementTools 
Get-Command -module ADDSDeployment

$dominioFQDN = "edu-gva.es"
$dominioNETBIOS = "EDU-GVA"
$adminPass = "Sv21nc-4e"
Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$False `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Default" `
-DomainName $dominioFQDN `
-DomainNetbiosName $dominioNETBIOS `
-SafeModeAdministratorPassword (ConvertTo-SecureString -string $adminPass -AsPlainText -Force)`
-ForestMode "Default" `
-InstallDns:$True `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$False `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true 
