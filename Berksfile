metadata

cookbook 'rackspace_logrotate', '~> 2.0', github: 'rackspace-cookbooks/rackspace_logrotate'
cookbook 'rackspace_cloudmonitoring', '~> 2.1', github: 'rackspace-cookbooks/rackspace_cloudmonitoring'
# dependency of rackspace_cloudmonitoring
cookbook 'rackspace_yum', '~> 4.0', github: 'rackspace-cookbooks/rackspace_yum'

group :integration do
  cookbook 'rackspace_apt', '~> 3.0', git: 'git@github.com:rackspace-cookbooks/rackspace_apt.git'
  cookbook 'with_maas', path: './test/fixtures/cookbooks/with_maas'
end
