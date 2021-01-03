$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.5.0.28/AGS-3.5.0.28-P6.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url

  softwareName  = 'Adventure Game Studio 3.5.0' 
  
  checksum      = '72f0721b16810668bfa3574ed91be5d3'
  checksumType  = 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /MERGETASKS="!vcredist" /SUPPRESSMSGBOXES /NORESTART /SP-' 
}

Install-ChocolateyPackage @packageArgs 
