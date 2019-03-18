$packageName = 'SKYSITE Facilities and Archive Sync'
$fileType = 'exe'
$url32 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.exe'
$url64 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x64.exe'
$checksum32 = '39af2de8c23b88d3d9419503b2b53952a5153c4aa09cf8c81cbd71db6d47199e'
$checksum64 = '4f562abe538b1aa0c9437329fcdfa0630364b0d09154adeb34fc6c2096357f0f'
$checksumType32 = 'sha256'
$checksumType64 = 'sha256'
$silentArgs = '/S /v/qn'
$version='3.4.1.1'
$validExitCodes=@(0,-1073741819)

$packageArgs = @{
  packageName   = $packageName
  fileType      = $fileType
  url           = $url32
  url64bit      = $url64
  silentArgs    = $silentArgs
  softwareName  = $packageName
  checksum      = $checksum32
  checksumType  = $checksumType32
  checksum64     = $checksum64
  checksumType64 = $checksumType64
  validExitCodes = $validExitCodes
}

#This checks to see if current version is already installed
Write-Output "Checking to see if local install is already up to date..."
$checkreg64 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, PSChildName | Where-Object { $_.DisplayName -like 'SKYSITE Facilities and Archive Sync' -and ([Version]$_.DisplayVersion) -eq $version} -ErrorAction SilentlyContinue
$checkreg32 = Get-ItemProperty HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, PSChildName | Where-Object { $_.DisplayName -like 'SKYSITE Facilities and Archive Sync' -and ([Version]$_.DisplayVersion) -eq $version} -ErrorAction SilentlyContinue

if ($checkreg32 -ne $null -OR $checkreg64 -ne $null) {
  Write-Output "SSF&A $version is already installed. Skipping download and installation"
} else {
  Install-ChocolateyPackage @packageArgs
}

