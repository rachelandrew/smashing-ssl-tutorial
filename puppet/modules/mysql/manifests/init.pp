class mysql(
    $root_pw = hiera('mysql_root_password'),
  ) {
  
  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-password":
    

    unless => "/usr/bin/mysqladmin -uroot -p$root_pw status",
    command => "/usr/bin/mysqladmin -uroot password $root_pw",
    require => Service["mysql"],
  }



}