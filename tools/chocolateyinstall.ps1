$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.4.3.1/AGS-3.4.3-P1.exe' 
$url64      = 'https://github.com/adventuregamestudio/ags/releases/download/v.3.4.3.1/AGS-3.4.3-P1.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url
  url64bit      = $url64

  softwareName  = 'Adventure Game Studio 3.4.3' 
  
  checksum      = '89ef0fcb9ef460352039d2bb589eff31'
  checksumType  = 'md5'
  checksum64    = '89ef0fcb9ef460352039d2bb589eff31'
  checksumType64= 'md5'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /MERGETASKS="!desktopicon" /SUPPRESSMSGBOXES /NORESTART /SP-' 
}

Install-ChocolateyPackage @packageArgs 
