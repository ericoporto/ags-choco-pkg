$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.5.0.23/AGS-3.5.0.23-P1.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url

  softwareName  = 'Adventure Game Studio 3.5.0' 
  
  checksum      = 'dba33862d916b13f724cd0f7df1bd999'
  checksumType  = 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /MERGETASKS="!vcredist" /SUPPRESSMSGBOXES /NORESTART /SP-' 
}

Install-ChocolateyPackage @packageArgs 
