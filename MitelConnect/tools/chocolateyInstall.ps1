$packageName = 'Mitel Connect'
$fileType = 'exe'
$url32 = 'http://upgrade01.sky.shoretel.com/ClientInstall'
$checksum32 = '4D6BD67D3251C4C4041C6DD7F9B3336B9C6FC85C879B599E1C707289D726DA08'
$checksumType32 = 'sha256'
$silentArgs = '/S /v/qn'
$version='213.100.3953.0'
$validExitCodes=@(0,-1073741819)
$useragent = [Microsoft.PowerShell.Commands.PSUserAgent]::InternetExplorer + " chocolatey command line"
$options =
@{
  Headers = @{
    'User-Agent' = $useragent
  }
}

$packageArgs = @{
  packageName   = $packageName
  fileType      = $fileType
  url           = $url32
  silentArgs    = $silentArgs
  softwareName  = $packageName
  checksum      = $checksum32
  checksumType  = $checksumType32
  validExitCodes = $validExitCodes
  Options       = $options
}

Install-ChocolateyPackage @packageArgs
