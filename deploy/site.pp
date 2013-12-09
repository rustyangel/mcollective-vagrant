node default {
  if $::hostname =~ /^middleware/ {
     $role = "middleware"
  } else {
     $role = "node"
  }

  if $::hostname == "node0" {
    package{"httpd": ensure => present }
    service{"httpd": ensure => running, enable => true }
  }
  package{"vim-enhanced": ensure => present }

  class{"roles::${role}": } ->

  file{"/etc/mcollective/classes.txt":
    owner => root,
    group => root,
    mode => 0444,
    content => inline_template("<%= classes.join('\n') %>")
  }

  host{"puppet":
    ip => "192.168.2.10"
  }
}
