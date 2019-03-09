$test=$false

import-module au

$myDir=$myinvocation.mycommand.path | split-path

$url = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.msi'
$file='SSF&ASync-x86.msi'

function global:au_SearchReplace {
       @{
        ".\tools\chocolateyInstall.ps1" = @{
        }
    }
}

function global:au_GetLatest {
    if ( -not $test ) {Invoke-WebRequest -Uri $url -OutFile $file}

    $version = & .\Get-MSIFileInformation.ps1 -path "$myDir\$file" -Property ProductVersion
    $version = $([string]$version).Trim()


    @{
        url32 = $url
        Version = $version
    }
}

Update-Package -ChecksumFor none