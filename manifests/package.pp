class nrsysmond::package {
  include nrsysmond::repo

  package { 'newrelic-sysmond':
    ensure  => latest,
    require => Class["nrsysmond::repo"],
    notify  => Class["nrsysmond::server"];
  }
}
