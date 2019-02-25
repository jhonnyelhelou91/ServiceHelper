$ErrorActionPreference = "Stop"
function Stop-Services {
    param(
        [long]
        $threads = 0,
        [long]
        $ramMB = 0,
		[Parameter(Mandatory=$true)]
		[string]
		$regex
	);

    $processes = Get-Services -threads $threads -ramMB $ramMB -regex $regex;

    ForEach ($process in $processes) {
	    $processName = [string]$process.Name;
	    Write-Host "Stopping Service $processName";
	    Stop-Service -Name "$processName" -Force
    }
}
function Restart-Services {
    param(
        [long]
        $threads = 0,
        [long]
        $ramMB = 0,
		[Parameter(Mandatory=$true)]
		[string]
		$regex
	);

    $processes = Get-Services -threads $threads -ramMB $ramMB -regex $regex;

    ForEach ($process in $processes) {
	    $processName = [string]$process.Name;
	    Write-Host "Stopping Service $processName";
	    Stop-Service -Name "$processName" -Force
	    Write-Host "Starting Service $processName";
	    Start-Service -Name "$processName"
    }
}
function Get-Services {
    param(
        [long]
        $threads = 0,
        [long]
        $ramMB = 0,
		[string]
		$regex = "*"
	);
		
	$processes = Get-Process |
		Where-Object {
			$_.Name -like $regex -and (Get-Service $_.Name -ErrorAction SilentlyContinue) -ne $null	
		} |
        Select-Object Name, ID, @{Name='ThreadCount';Expression ={$_.Threads.Count}}, @{Name='RamMB';Expression={($_.WS/1MB)}} |
        Where-Object {
			$_.ThreadCount -ge $threads -Or
			$_.RamMB -ge $ramMB
        } |
        Sort-Object -Property ThreadCount -Descending;

    return $processes;
}

Export-ModuleMember -Function Stop-Services
Export-ModuleMember -Function Restart-Services
Export-ModuleMember -Function Get-Services
