$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.5.1.13/AGS-3.5.1.13-P6.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url

  softwareName  = 'Adventure Game Studio 3.5.1' 
  
  checksum      = 'E8EB243F81DAE1C365D3DAAD4E149865'
  checksumType  = 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /MERGETASKS="!vcredist" /SUPPRESSMSGBOXES /NORESTART /SP-' 
}

Install-ChocolateyPackage @packageArgs 
