class puppet::master::config {
	file{"/etc/puppet/manifests/site.pp":
    ensure => symlink,
    target => "/vagrant/deploy/site.pp",
    force => true,
	}

  file {"/etc/puppet/modules":
    ensure => symlink,
    target => "/vagrant/deploy/modules",
    force => true,
  }

	file{"/etc/puppet/autosign.conf":
	   source => "puppet:///modules/puppet/autosign.conf",
	   owner => root,
	   group => root,
	   mode => 644
    }
}
