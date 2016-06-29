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
    require => Package['memcached'],
}
  file { 'memcached':
    ensure => file,
    path => '/etc/sysconfig/memcached'
    owner  => root,
    group  => root,
    mode   => 0664,
    source => 'puppet:///modules/memcached/sysconfig',
  }
}
