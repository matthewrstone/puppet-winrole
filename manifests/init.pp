# Module to Add Windows Roles to Server
define winrole(
  $ensure,
  $role,
  $name,
) {
  case $ensure {
    'present','installed': { $command = 'Add-WindowsFeature' 
                             $eq = '-eq' 
                           }
    'absent', 'removed' : { $command = 'Remove-WindowsFeature'
                            $eq = '-ne' 
                          }
  }
  exec {"${command} ${name} on ${::hostname}":
    command    => "Import-Module ServerManager; ${command} ${role}",
    onlyif     => "If ((Get-WindowsFeature -Name ${role}).Installed ${eq} 'True') { exit 1 } else { exit 0 }",
    provider   => powershell,
  }
}
