class web {
 package { 'apache2':
 ensure => installed,
 allowcdrom => "true",
 }
 file { '/var/www/html/web.html':
 require => package['apache2'],
 content => "<h1>Web sivu</h1>\n",
 }

 exec { 'rm /var/www/html/index.html':
 command => 'sudo rm /var/www/html/index.html',
 path => ['/bin', '/usr/bin'],
 require => package['apache2'],
 }
}
