$test=$true

import-module au

$myDir=$myinvocation.mycommand.path | split-path

$releases = 'https://fa.skysite.com/app/FASynchronization/AutoupdateInfo.xml'
$url32 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.exe'
$url64 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x64.exe'


function global:au_BeforeUpdate {
  # We need this, otherwise the checksum won't get created
  # The 64 bit download throws a size error in Get-ChocolateyWebFile.
  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32
  $Latest.ChecksumType64 = 'sha256'
  $Latest.Checksum64     = Get-RemoteChecksum $Latest.URL64

}

function global:au_SearchReplace {
       @{
        ".\tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*\`$checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
          "(?i)(^\s*\`$checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
          "(?i)(^\s*\`$checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
          "(?i)(^\s*\`$checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
           "(?i)(^\s*\`$version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }
    }
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing
    [xml]$xml = $response.Content
    $version = $xml.UpdateFileList.LocalFile[0].latestVersion

    @{
        url32 = $url32
        url64 = $url64
        Version = $version
    }
}

Update-Package -ChecksumFor none -NoCheckChocoVersion $true