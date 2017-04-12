class palomuuri {
 package { 'ufw':
 ensure => installed,
 allowcdrom => "true",
 }

 exec { 'sudo ufw enable':
 command => 'sudo ufw enable',
 path => ['/bin', '/usr/bin'],
 require => package['ufw'],
 }
}
