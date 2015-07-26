stage { 'setup':
  before => Stage['main']
}

class { 'base':
  stage => 'setup'
}

include base, apache, mysql, php, bootstrap, varnish