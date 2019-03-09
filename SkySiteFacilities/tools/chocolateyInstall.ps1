$packageName = 'SKYSITE Facilities and Archive Sync'
$fileType = 'msi'
$url = 'https://fa.skysite.com/app/FASynchronization/SSF&ASync-x86.msi'
$silentArgs = '/quiet'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
