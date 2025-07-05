# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

# Get hostname from facts
$hostname = $facts['hostname']

# Create custom header config
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => file,
  content => "add_header X-Served-By \"${hostname}\";\n",
  notify  => Service['nginx'],
}

# Ensure default site config includes custom header config
exec { 'include_custom_header':
  command => 'sed -i "/server {/a \\    include /etc/nginx/conf.d/custom_headers.conf;" /etc/nginx/sites-available/default',
  unless  => 'grep -q custom_headers.conf /etc/nginx/sites-available/default',
  require => File['/etc/nginx/conf.d/custom_headers.conf'],
  notify  => Service['nginx'],
}
}