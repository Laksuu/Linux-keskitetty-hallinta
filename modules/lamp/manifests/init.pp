class lamp {
    package { 'apache2':
            ensure => installed,
            allowcdrom => "true",
    }

    package { 'mysql-server':
            ensure => installed,
            allowcdrom => "true",
    }

    package { 'php7.0':
            ensure => installed,
	    allowcdrom => "true",
    }

    exec { "sudo apt-get update":
            command => 'sudo apt-get update',
            path => ["/usr/bin", "/usr/sbin"],
    }
}
