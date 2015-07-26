class varnish {
  include varnish::install, varnish::params, varnish::config, varnish::service
}