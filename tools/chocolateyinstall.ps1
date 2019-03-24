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

if(-not (test-path "hklm:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5")) {
  if((wmic os get caption | Out-String).Contains("Server")) {
    $packageArgs = "/c DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx3"
    $statements = "cmd.exe $packageArgs"
    Start-ChocolateyProcessAsAdmin "$statements" -minimized -nosleep -validExitCodes @(0, 1)
  }
  $packageArgs = "/c DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx3"
  $statements = "cmd.exe $packageArgs"
  Start-ChocolateyProcessAsAdmin "$statements" -minimized -nosleep -validExitCodes @(0)
}
else {
  Write-Host "Microsoft .Net 3.5 Framework is already installed on your machine."
} 

if(-not (test-path "hklm:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4.0")) {
  if((wmic os get caption | Out-String).Contains("Server")) {
    $packageArgs = "/c DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx4"
    $statements = "cmd.exe $packageArgs"
    Start-ChocolateyProcessAsAdmin "$statements" -minimized -nosleep -validExitCodes @(0, 1)
  }
  $packageArgs = "/c DISM /Online /NoRestart /Enable-Feature /FeatureName:NetFx4"
  $statements = "cmd.exe $packageArgs"
  Start-ChocolateyProcessAsAdmin "$statements" -minimized -nosleep -validExitCodes @(0)
}
else {
  Write-Host "Microsoft .Net 4.0 Framework is already installed on your machine."
} 

Install-ChocolateyPackage @packageArgs 