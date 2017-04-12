class ausersite {

	package { 'apache2':
		ensure => installed,
		name => "apache2",
		allowcdrom => "true",
	}

	file { '/home/xubuntu/julkinen':
		ensure => 'directory',
		require => Package["apache2"],
		before => File['/home/xubuntu/julkinen/index.html'],
	}

	file { '/home/xubuntu/julkinen/index.html':
		content => "<h1>Tervetuloa Pyry Laakkosen sivustolle!</h1>",
		require => Package["apache2"],
	}

	file { '/etc/apache2/sites-available/site.conf':
		content => template('ausersite/site.conf'),
		require => [ Package["apache2"], File['/home/xubuntu/julkinen'], File['/home/xubuntu/julkinen/index.html'] ],
		notify => Service["apache2"],
	}

	service { 'apache2':
		ensure => "running",
		enable => "true",
		require => Package["apache2"],
	}

	exec { "sudo a2ensite site.conf":
		command => 'sudo a2ensite site.conf',
		path => ["/usr/bin", "/usr/sbin"],
		require => [ Package['apache2'], File['/etc/apache2/sites-available/site.conf'] ],
		notify => Service["apache2"],
	}

	exec { "sudo a2enmod userdir":
		command => 'sudo a2enmod userdir',
		path => ["/usr/bin", "/usr/sbin"],
		require => [ Package['apache2'], File['/etc/apache2/sites-available/site.conf'] ],
		notify => Service["apache2"],
	}

	exec { "sudo a2dissite 000-default.conf":
		command => 'sudo a2dissite 000-default.conf',
		path => ["/usr/bin", "/usr/sbin"],
		require => Package['apache2'],
		notify => Service["apache2"],
	}
}
