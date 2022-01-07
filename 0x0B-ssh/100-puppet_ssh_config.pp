# Configure ssh client configuration
exec { 'no password Auth':
  command => 'sh -c "/bin/echo passwordAuthentication no >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'new identity file':
  command => 'sh -c "/bin/echo IdentityFile ~/.ssh/school >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
exec { 'public key Auth':
  command => 'sh -c "/bin/echo PubkeyAuthentication yes >> /etc/ssh/ssh_config"',
  path    => '/usr/bin:/usr/sbin:/bin'
}
