class pyrylaakkonensite {
    package { 'apache2':
            ensure => installed,
            name => "apache2",
            allowcdrom => "true",
    }

    file { '/var/www/sivusto':
            ensure => 'directory',
            require => Package["apache2"],
            before => File['/var/www/sivusto/index.html'],
    }


    file { '/var/www/sivusto/index.html':
            content => "<h1>Tervetuloa Pyry Laakkosen sivustolle!</h1>",
            require => Package["apache2"],
    }

    file { '/etc/apache2/sites-available/pyrylaakkonen.conf':
            content => template('pyrylaakkonensite/pyrylaakkonen.conf'),
            require => [ Package["apache2"], File['/var/www/sivusto'], File['/var/www/sivusto/index.html'] ],
            notify => Service["apache2"],
    }

    service { 'apache2':
            ensure => "running",
            enable => "true",
            require => Package["apache2"],
    }
    exec { "sudo a2ensite pyrylaakkonen.conf":
            command => 'sudo a2ensite pyrylaakkonen.conf',
            path => ["/usr/bin", "/usr/sbin"],
            require => [ Package['apache2'], File['/etc/apache2/sites-available/pyrylaakkonen.conf'] ],
            notify => Service["apache2"],
    }
}
