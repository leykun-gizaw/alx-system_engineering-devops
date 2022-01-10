# Puppet manifest to perform all previous tasks
exec { 'update apt repository':
  command => 'sudo apt update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}

package { 'nginx':
  ensure   => present,
  provider => apt,
}

file { 'home page':
  ensure  => file,
  path    => '/var/www/html/index.html',
  mode    => '+rw',
  content => 'Hello, World!\n'
}

file { '404 page':
  ensure  => file,
  path    => '/var/www/error/custom_404.html',
  mode    => '+rw',
  content => 'Ceci n\'est pas une page\n'
}

file { 'default nginx config file':
  ensure  => file,
  path    => '/etc/nginx/sites-available/default',
  mode    => '+rw',
  content => '\
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;
    server_name _;

    error_page 404 /custom_404.html;
    location /custom_404.html {
        root /var/www/error;
        internal;
    }

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /redirect_me/ {
        rewrite ^(.*)$ http://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }
}'
}

exec { 'restart nginx':
  command => 'service nginx restart',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}
