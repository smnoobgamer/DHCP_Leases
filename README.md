# DHCP Leases Export Script

This repository contains a PowerShell script designed to export all DHCP leases from a DHCP server to a CSV file. Each time the script runs, it generates a new CSV file with a timestamp in its filename to ensure uniqueness.

## Features

- Retrieves all DHCP leases from the server.
- Exports lease data to a CSV file with specified headers.
- Automatically appends a timestamp to each CSV file name for unique identification.

## CSV File Format

The exported CSV file contains the following fields:

- `ScopeId`: The identifier of the DHCP scope.
- `IPAddress`: The IP address leased to the client.
- `HostName`: The hostname of the client.
- `ClientID`: The client identifier (often the MAC address).
- `AddressState`: The current state of the IP address lease.

## Prerequisites

- Windows operating system with PowerShell support.
- DHCP server management tools must be installed.
- Sufficient permissions to access the DHCP server data.

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    ```

2. Navigate to the directory containing the script.

3. Open PowerShell with administrative privileges.

4. Run the script:

    ```shell
    .\Export-DHCPLeases.ps1
    ```

   This will generate a CSV file in the specified directory with the current timestamp included in the filename.

## Configuration

- Modify the `$csvFilePath` variable to specify the desired output directory for the CSV files.



