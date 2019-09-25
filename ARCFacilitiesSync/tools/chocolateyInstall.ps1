$packageName = 'ARC Facilities and Archive Sync'
$fileType = 'exe'
$url32 = 'https://app.arcfacilities.co/app/FASynchronization/ARCFacilitiesSync-x86.exe'
$url64 = 'https://app.arcfacilities.co/app/FASynchronization/ARCFacilitiesSync-x64.exe'
$checksum32 = '730F293CC6A1A59EB57A581FBD810B4C7E58CBF24C5D2C0AEC1802733BD98FCE'
$checksum64 = '33205E801E4A6C3FE446E9D539DE27D67103F95055A3C85D7C3DB1FDD7D65584'
$checksumType32 = 'sha256'
$checksumType64 = 'sha256'
$silentArgs = '/S /v/qn'
$version='1.2.0.0'
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


