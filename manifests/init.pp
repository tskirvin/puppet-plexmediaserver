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
  $repo = 'http://shell.ninthgate.se/packages/debian',
  $key  = '675E23EE61EE92348890FC5043525C28E533491A'
) {
  apt::source { 'plexmediaserver': location => $repo }

  apt::key { 'ninthgate-se': id => $key }

  package { 'plexmediaserver':
    ensure  => installed,
    require => [ Apt::Key['ninthgate-se'], Apt::Source['plexmediaserver']]
  }

  service { 'plexmediaserver': ensure => running, enable    => true }
}
