package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
}

file_line { 'redirect config':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => '    location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }',
  require => Package['nginx'],
}

exec { 'reload-nginx':
  command     => '/usr/sbin/service nginx reload',
  refreshonly => true,
  subscribe   => File_line['redirect config'],
}
