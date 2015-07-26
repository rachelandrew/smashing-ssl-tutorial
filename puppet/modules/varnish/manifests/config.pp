class varnish::config {
  include varnish::params
  $varnish_port = $varnish::params::varnish_port
  $apache_port = $varnish::params::apache_port
  
  file { '/etc/varnish/default.vcl':
    ensure        => present,
    content       => template("varnish/varnish.conf.erb"),
    require       => Class["varnish::install"],
    notify        => Class["varnish::service"],
  }

  file { '/etc/default/varnish':
    ensure        => present,
    content       => template("varnish/varnish.default.erb"),
    require       => Class["varnish::install"],
    before        => File['/etc/varnish/default.vcl'],
  }
}