$test=$false

import-module au

$myDir=$myinvocation.mycommand.path | split-path

$url32 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.msi'
$url64 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x64.msi'
$file='SSF&ASync-x86.msi'

function global:au_SearchReplace {
       @{
        ".\tools\chocolateyInstall.ps1" = @{
        }
    }
}

function global:au_GetLatest {
    if ( -not $test ) {Invoke-WebRequest -Uri $url32 -OutFile $file}

    $version = & .\Get-MSIFileInformation.ps1 -path "$myDir\$file" -Property ProductVersion
    $version = $([string]$version).Trim()


    @{
        url32 = $url32
        url64 = $url64
        Version = $version
    }
}

Update-Package -ChecksumFor none