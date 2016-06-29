# Class: memcached
#
#
class memcached {
  # resources
  package { 'memcached':
    ensure => 'installed',
  }
  service { 'memcached':
    enable => true,
    ensure => running,
}
  file { '/etc/sysconfig/memcached':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => 0644,
    content => 'PORT="11211"\n\rUSER="memcached"\n\rMAXCONN="96"\n\rCACHESIZE="32"\n\rOPTIONS= ""\n\r'
  }
}
