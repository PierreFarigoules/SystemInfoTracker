# Création des données directement comme un PSCustomObject complet
$data = [PSCustomObject]@{
    NomMachine      = [System.Environment]::MachineName
    AdresseIP       = (Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias Ethernet).IPAddress
    AdresseMAC      = (Get-NetAdapter -Name "Ethernet").MacAddress
    MemoireGB       = [math]::Round(((Get-WmiObject -Class Win32_OperatingSystem).TotalVisibleMemorySize / 1MB), 2)
    StockageTotalGB = [math]::Round((((Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3").Size | Measure-Object -Sum).Sum / 1GB), 2)
    DateHeure       = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
    OS              = [PSCustomObject]@{
        Nom          = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        Version      = (Get-WmiObject -Class Win32_OperatingSystem).Version
        Architecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture
    }
}

# YAML
$data | ConvertTo-Yaml | Out-File -Encoding utf8 "system_info.yaml"

# JSON
$data | ConvertTo-Json -Depth 3 | Out-File -Encoding utf8 "system_info.json"

# XML (fonctionne maintenant !)
$data | ConvertTo-Xml -As String -Depth 3 | Out-File -Encoding utf8 "system_info.xml"
