# Class: memcached
#
#
class memcached {
  # resources
  package { 'memcached':
    ensure => 'present',
  }
  service { 'memcached':
    enable => true,
    ensure => running,
    require => Package ['memcached']
}
  file { '/etc/sysconfig/memcached':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => 0644,
    content => 'PORT="11211"\n\rUSER="memcached"\n\rMAXCONN="96"\n\rCACHESIZE="32"\n\rOPTIONS= ""\n\r',
  }
}
