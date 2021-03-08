# delete vagrant directory
$VagrantDirName = '.\.vagrant'
if (Test-Path $VagrantDirName) {
  Remove-Item $VagrantDirName -Recurse
}

# delete log file
$LogFilename = 'ubuntu-xenial-16.04-cloudimg-console.log'
if (Test-Path $LogFilename) {
  Remove-Item $LogFilename
}



