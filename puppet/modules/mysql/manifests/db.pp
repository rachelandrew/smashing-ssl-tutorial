define mysql::db(
    $db_name     = false,
	$db_user     = false, 
	$db_password = false,
	$root_pw = hiera('mysql_root_password'),

	) {

    
    exec { "create-${db_name}":
      unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
      command => "/usr/bin/mysql -uroot -p${root_pw}  -e \"create database ${db_name}; grant all on ${db_name}.* to ${db_user}@localhost identified by '$db_password';\"",
      require => Exec["set-mysql-password"],
    }
  }