name              'rackspace_memcached'
maintainer        'Rackspace, US Inc.'
maintainer_email  'rackspace-cookbooks@rackspace.com'
license           'Apache 2.0'
description       'Installs memcached'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '2.0.1'

supports 'centos'
supports 'debian'
supports 'redhat'
supports 'ubuntu'

recipe 'memcached', 'Installs and configures memcached'
