# Configure ssh client configuration
exec { 'no password Auth':
  command => 'bash -c "echo PasswordAuthentication no >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'new identity file':
  command => 'bash -c "echo IdentityFile \'~/.ssh/school\' >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'public key Auth':
  command => 'bash -c "echo PublickeyAuthentication yes >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
