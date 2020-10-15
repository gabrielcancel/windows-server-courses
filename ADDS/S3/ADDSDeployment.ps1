#
# Script Windows PowerShell pour le déploiement d’AD DS
#

Install-WindowsFeature Ad-Domain-Services - IncludeManagemenTools

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "E:\ADDS\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "contoso.adds" `
-DomainNetbiosName "CONTOSO" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "E:\ADDS\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "E:\ADDS\SYSVOL" `
-Force:$true

