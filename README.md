How to install/uninstall DNS Feature, create DNS zones and add/remove records


```powershell
## Add role and management tools
Add-WindowsFeature DNS -IncludeManagementTools

# Create Primary Zone
Add-DnsServerPrimaryZone -Name "contoso.adds" -ZoneFile "contoso.adds.dns.txt"

# Create Reverse Lookup Zone
Add-DnsServerPrimaryZone -NetworkID 10.211.55.0/24 -ZoneFile "55.211.10.in-addr.arpa.dns.txt"

# Create A Record with PTR
Add-DnsServerResourceRecordA -Name "srv-win2019" -ZoneName "contoso.adds" -IPv4Address "10.211.55.11" -TimeToLive 01:00:00 -CreatePtr

#Create CNAME Record
Add-DnsServerResourceRecordCName -Name "www" -ZoneName "contoso.adds" -HostNameAlias "srv-win2019.contoso.adds"

# Create A Record without PTR
Add-DnsServerResourceRecordA -Name "host" -ZoneName "contoso.adds" -IPv4Address "10.31.1.55" -TimeToLive 01:00:00

# Remove A Zone
Remove-DnsServerResourceRecord -ZoneName "contoso.adds" -RRType "A" -Name "srv-win2019"

# Unistall DNS Service
Uninstall-WindowsFeature -Name DNS -IncludeManagementTools

# File are stored at
cd \Windows\System32\dns
```
