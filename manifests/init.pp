# Class nrsysmond
#
# Parameters:
#
#   license_key: NewRelic license key. Defaults to $::newrelic_license_key
#   ssl_enabled: Whether nrsysmond will use SSL to connect to NewRelic. Defaults to true.
#
# Example Usage:
#
#   class { 'nrsysmond':
#     license_key => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
#     ssl_enabled => false
#   }
#

class nrsysmond (
  $license_key = $::newrelic_license_key,
  $ssl_enabled = true
) {
  include nrsysmond::server
}
