class memcached {
  package { 'memcached':
    ensure => present,
  }

  file { 'memcached_sysconfig':
    ensure  => file,
    path    => '/etc/sysconfig/memcached',
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    source  => 'puppet:///modules/memcached/sysconfig',
    require => Package['memcached'],
  }

  service { 'memcached':
    ensure    => running,
    enable    => true,
    subscribe => File['memcached_sysconfig'],
  }
}
