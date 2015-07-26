class apache {
  
  package { "apache2":
    ensure => present,
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  file { "/etc/apache2/ports.conf":
    ensure => file,
    source => "puppet:///modules/apache/ports.conf",
    require => Package["apache2"],
    notify => Service['apache2'],
  }
}