$packageName = 'SKYSITE Facilities and Archive Sync'
$fileType = 'msi'
$url32 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.msi'
$url64 = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x64.msi'
$silentArgs = '/quiet'

$osBitness = Get-ProcessorBits

if ($osBitness -eq 64) {
  $url = $url64
} else {
  $url = $url32
}

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
