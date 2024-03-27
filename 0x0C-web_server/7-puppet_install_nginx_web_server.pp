# setting up nginx enviroment
# installing nginx

package { 'nginx':
  ensure => installed,
}

# file redirecting
file_line { 'redirecting':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

# file content
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# restarting nginx
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
