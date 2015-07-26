define apache::vhost(
	$vhost_docroot    = false,
	$vhost_name = false,
  $vhost_port = false,
	$vhost_options    = ['Indexes','FollowSymLinks','MultiViews'],

) {
	
  file {
    "/etc/apache2/sites-available/${vhost_name}.conf":
      content => template("apache/vhost-default.conf.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => '755',
      require => Package['apache2'],
   }

   exec {"enable_${vhost_name}":
    command => "a2ensite ${vhost_name}.conf",
    path => ["/usr/bin", "/usr/sbin", "/bin"],
    require =>  File["/etc/apache2/sites-available/${vhost_name}.conf"],
    notify     => Service["apache2"],
  }


}