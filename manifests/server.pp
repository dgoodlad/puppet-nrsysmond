class nrsysmond::server {
  include nrsysmond::package
  include nrsysmond::configuration

  Class["nrsysmond::package"] -> Class["nrsysmond::configuration"]

  service { "newrelic-sysmond":
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => Class["nrsysmond::configuration"];
  }

}
