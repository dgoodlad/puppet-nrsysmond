class nrsysmond::server {
  include nrsysmond::package
  include nrsysmond::configuration

  Class['nrsysmond::package'] -> Class['nrsysmond::configuration']

  service { 'newrelic-sysmond':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nrsysmond::configuration'];
  }

}
