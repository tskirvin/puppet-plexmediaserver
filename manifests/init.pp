# plexmediaserver
#
#   Install and start plexmediaserver.
#
# == Parameters
#
#  repo       Defaults to http://shell.ninthgate.se/packages/debian
#  version    Defaults to $lsbdistcodename
#
# == Requirements
#
#   apt       https://forge.puppetlabs.com/puppetlabs/apt
#
class plexmediaserver (
  $repo    = 'http://shell.ninthgate.se/packages/debian'
) {
  apt::source { 'plexmediaserver': location => $repo }

  apt::key { 'ninthgate-se': id => '50EE969049C1996AD773A391E639BFCB72740199' }

  package { 'plexmediaserver':
    ensure  => installed,
    require => [ Apt::Key['ninthgate-se'], Apt::Source['plexmediaserver']]
  }

  service { 'plexmediaserver': ensure => running, enable => true }
}
