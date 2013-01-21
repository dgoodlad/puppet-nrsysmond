class nrsysmond::license(
  $license_key = $nrsysmond::license_key
) {
  include nrsysmond::package

  if $license_key == undef { fail('$newrelic::license_key is not defined. Please set it on nrsysmond or set $::newrelic_license_key.') }

  exec { 'newrelic-set-license-key':
    unless  => "egrep -q '^license_key=${license_key}$' /etc/newrelic/nrsysmond.cfg",
    command => "nrsysmond-config --set license_key=${license_key}",
    notify  => Service['newrelic-sysmond'];
  }
}
