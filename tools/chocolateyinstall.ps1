$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.5.1.10/AGS-3.5.1.10-P3.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url

  softwareName  = 'Adventure Game Studio 3.5.1' 
  
  checksum      = '41AD1D82096B34EB3439BAB1F5BC83A3'
  checksumType  = 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /MERGETASKS="!vcredist" /SUPPRESSMSGBOXES /NORESTART /SP-' 
}

Install-ChocolateyPackage @packageArgs 
