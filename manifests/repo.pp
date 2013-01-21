class nrsysmond::repo {
  include apt

  apt::source { 'newrelic':
    location          => 'http://apt.newrelic.com/debian/',
    release           => 'newrelic',
    repos             => 'non-free',
    key               => '548C16BF',
    key_server        => 'subkeys.pgp.net',
    pin               => '500',
    include_src       => false
  }
}
