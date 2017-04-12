class sshport8888 {

 package {'ssh':
 ensure => 'installed',
 name => "ssh",
 allowcdrom => "true",
 }

 file { '/etc/ssh/sshd_config':
 content => template("sshport8888/sshd_config"),
 require => Package["ssh"],
 notify => Service["ssh"],
 }

 service {'ssh':
 ensure => 'running',
 enable => 'true',
 require => Package["ssh"],
 }
}
