$packageName = 'ARC Facilities and Archive Sync'
$fileType = 'exe'
$url32 = 'https://app.arcfacilities.co/app/FASynchronization/ARCFacilitiesSync-x86.exe'
$url64 = 'https://app.arcfacilities.co/app/FASynchronization/ARCFacilitiesSync-x64.exe'
$checksum32 = 'EE5E869965E873306AD3ECCEDFB9454CBEF961039893CFD5851E1CCFCB6B90AF'
$checksum64 = 'C38C0648C42B8F06A8B87E8584076D19FB6D4944FCB41915F3039505A839141B'
$checksumType32 = 'sha256'
$checksumType64 = 'sha256'
$silentArgs = '/S /bc:\windows\temp /v/qn'
$version='1.2.1.0'
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

Install-ChocolateyPackage @packageArgs


