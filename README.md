# Service Helpers

PowerShell Helper scripts to manage windows services.

## Getting Started

* Copy the files
* Open Command Line or PowerShell (*Window + X, A*)
* If you opened Command Prompt, then type *powershell* in order to use PowerShell commands
* Navigate to the scripts directory <br />`cd your_directory`
* Type <br />`Import-Module .\ServiceHelper.psm1`
* Now you can use the methods from your PowerShell session

### Adding Script to Profile [Optional]

* Enable execution policy using PowerShell Admin <br /> `Set-ExecutionPolicy Unrestricted`
* Navigate to the profile path <br />`cd (Split-Path -parent $PROFILE)`
* Open the location in Explorer <br />`ii .`
* Create the user profile if it does not exist <br />`If (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }`
* Import the module in the PowerShell profile <br />`Import-Module -Path script_directory -ErrorAction SilentlyContinue`

# Examples

## Get-Services Example
Get all services that match the specified parameters
<details>
   <summary>Get all services</summary>
   <p>Get-Services</p>
</details>
<details>
   <summary>Get all services with name contains keyword custom</summary>
   <p>Get-Services -regex '*custom*'</p>
</details>
<details>
   <summary>Get all services consuming more than 500MB RAM</summary>
   <p>Get-Services -ramMB 500</p>
</details>
<details>
   <summary>Get all services consuming more than 100 threads</summary>
   <p>Get-Services -threads 100</p>
</details>
<details>
   <summary>Get all services consuming more than 100 threads or 500MB RAM</summary>
   <p>Get-Services -ramMB 500 -threads 100</p>
</details>

## Stop-Services Example
Stop all services that match the specified parameters
<details>
   <summary>Stop all services with name contains keyword custom</summary>
   <p>Stop-Services -regex '*custom*'</p>
</details>
<details>
   <summary>Stop all services consuming more than 500MB RAM</summary>
   <p>Stop-Services -ramMB 500</p>
</details>
<details>
   <summary>Stop all services consuming more than 100 threads</summary>
   <p>Stop-Services -threads 100</p>
</details>
<details>
   <summary>Stop all services consuming more than 100 threads or 500MB RAM</summary>
   <p>Stop-Services -ramMB 500 -threads 100</p>
</details>

## Restart-Services Example
Restart all services that match the specified parameters
<details>
   <summary>Restart all services with name contains keyword custom</summary>
   <p>Restart-Services -regex '*custom*'</p>
</details>
<details>
   <summary>Restart all services consuming more than 500MB RAM</summary>
   <p>Restart-Services -ramMB 500</p>
</details>
<details>
   <summary>Restart all services consuming more than 100 threads</summary>
   <p>Restart-Services -threads 100</p>
</details>
<details>
   <summary>Restart all services consuming more than 100 threads or 500MB RAM</summary>
   <p>Restart-Services -ramMB 500 -threads 100</p>
</details>
