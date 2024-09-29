# Get the current date and time in the desired format
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

# Define the CSV file path, including the timestamp in the file name
$csvFilePath = "C:\Users\somo001\Documents\DHCP_Leases\DHCPLeases_$timestamp.csv"

# Import the DHCP PowerShell module
Import-Module DHCPServer

# Get all DHCP scopes
$scopes = Get-DhcpServerv4Scope

# Create an array to hold the lease information
$leases = @()

# Loop through each scope and retrieve the lease information
foreach ($scope in $scopes) {
    $scopeId = $scope.ScopeId

    # Get all leases for the current scope
    $scopeLeases = Get-DhcpServerv4Lease -ScopeId $scopeId

    # Add each lease to the leases array
    foreach ($lease in $scopeLeases) {
        $leases += [PSCustomObject]@{
            "ScopeId"      = $scopeId
            "IPAddress"    = $lease.IPAddress
            "HostName"     = $lease.HostName
            "ClientID"     = $lease.ClientId
            "AddressState" = $lease.AddressState
        }
    }
}

# Export the leases to a CSV file
$leases | Export-Csv -Path $csvFilePath -NoTypeInformation -Delimiter ";"

Write-Host "DHCP leases have been exported to $csvFilePath"
