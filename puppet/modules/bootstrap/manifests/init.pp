class bootstrap {

# Make sure everything is installed

$sites = hiera_hash('apache_vhosts')

create_resources('apache::vhost',$sites)

$databases = hiera_hash('mysql_db')

create_resources('mysql::db',$databases)

}