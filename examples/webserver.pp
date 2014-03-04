class webserver{
  windows_role{"${::hostname} - IIS Server":
    ensure => present,
    name   => 'IIS Web Server',
    role   => 'Web-Server',
  }
  windows_role{"${::hostname} - .NET 3.5 Framework":
    ensure => present,
    name   => '.NET 3.5 Framework',
    role   => 'Net-Framework-Core',
  }
  windows_role{"${::hostname} - .NET 4.5 Framework":
    ensure => present,
    name   => '.NET 4.5 Framework',
    role   => 'Net-Framework-45-Core',
  }
  windows_role{"${::hostname} - FTP Server":
    ensure => absent,
    name   => 'FTP Server',
    role   => 'Web-FTP-Server',
  }
}
