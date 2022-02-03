<#"""
This script have function call "get-instaceMatadata", which will query the IMDB service
to pull the instance matadata.

Install this script using dot sourcing

> cd to "script location" 
> . \Get-VmMetadata.ps1

# then you can query the metadata -

#without command switch display all metadata
> get-instanceMatadata 

# to get specific resource metadata as follows;
> get-instanceMatadata -MDKey /compute


Note- IMDS is a REST API that's available at a well-known, non-routable IP address
 (169.254.169.254). You can only access it from within the VM.
"""#>

function get-instanceMatadata {
    [CmdletBinding()]
    param (
        # provide the key to export the instacne metadata for it
        # key is like - /compute, /network, /network/interface
        [Parameter(Mandatory=$false)]
        [string]$MDKey
    )
    
    $uri="http://169.254.169.254/metadata/instance"
    $api="?api-version=2021-02-01"

    function getInstance{
        $url=$uri+$api
        $result = Invoke-RestMethod -Method GET -Uri $url -Headers @{"Metadata"="True"}
        return $result
    }

    function getUsingKey($key){
    $url=$uri+$key+$api
    $result = Invoke-RestMethod -Method GET -Uri $url -Headers @{"Metadata"="True"}
    return $result
    }

    if ($MDKey -eq $null){
        $instance= getInstance
        $instance | ConvertTo-Json -Depth 64
    } else {
        $usingKey=getUsingKey($MDKey)
        $usingKey |ConvertTo-Json -Depth 64
        
    }

}