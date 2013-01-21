class nrsysmond::configuration (
  $license_key = $nrsysmond::license_key,
  $ssl_enabled = $nrsysmond::ssl_enabled
) {
  include nrsysmond::package

  if $license_key == undef {
    fail('$newrelic::license_key is not defined. Please set it on nrsysmond or set $::newrelic_license_key.')
  }

  Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin' }

  exec { 'nrsysmond-set-license-key':
    unless  => "egrep -q '^license_key=${license_key}$' /etc/newrelic/nrsysmond.cfg",
    command => "nrsysmond-config --set license_key=${license_key}",
    notify  => Service['newrelic-sysmond'];
  }

  exec { 'nrsysmond-set-ssl':
    unless  => "egrep -q '^ssl=${ssl_enabled}$' /etc/newrelic/nrsysmond.cfg",
    command => "nrsysmond-config --set ssl=${ssl_enabled}",
    notify  => Service['newrelic-sysmond'];
  }
}
