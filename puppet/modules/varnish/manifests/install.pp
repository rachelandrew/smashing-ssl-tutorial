class varnish::install {
  
  exec { 'install_transport_https':
    command => "/usr/bin/apt-get install apt-transport-https",
  }

  file { 'debian_package':
      path     => '/etc/apt/sources.list.d/varnish.list',
      ensure   => 'present',
      source   => "puppet:///modules/varnish/varnish.list",
      require => Exec['install_transport_https'],
      before => Exec['add_key'],
    }

  exec {  'add_key':
    command => "curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -",
    path => ["/usr/bin", "/usr/sbin", "/bin"],
    before => Exec['apt-get_update'],
    require =>  Package['curl'],
  }

  exec { 'apt-get_update':
    command => "/usr/bin/apt-get update",
    require => Exec['add_key'],
  }

  package { 'varnish':
    ensure  => installed,
    require => Exec['apt-get_update'],
  }
}