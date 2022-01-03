# execute kill command
#
exec { 'pkill':
  command  => 'pkill killmenow',
  provider => 'shell',
}
