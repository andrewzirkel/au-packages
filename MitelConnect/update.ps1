$test=$false

import-module au

$myDir=$myinvocation.mycommand.path | split-path

$url32 = 'http://upgrade01.sky.shoretel.com/ClientInstall'
$file= 'MitelConnect.exe'

function global:au_BeforeUpdate {
  # We need this, otherwise the checksum won't get created
  # The 64 bit download throws a size error in Get-ChocolateyWebFile.
  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32     = (Get-FileHash "$myDir\$file").Hash
}

function global:au_SearchReplace {
       @{
        ".\tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*\`$checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
          "(?i)(^\s*\`$checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
          "(?i)(^\s*\`$version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }
    }
}

function global:au_GetLatest {
    if ( -not $test ) {Invoke-WebRequest -Uri $url32 -OutFile $file}

    $version = (Get-Item "$myDir\$file").VersionInfo.FileVersion


    @{
        url32 = $url32 
        Version = $version
    }
}

Update-Package -ChecksumFor none -NoCheckUrl