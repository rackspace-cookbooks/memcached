#
# Cookbook Name:: rackspace_memcached
# Recipe:: default
#
# Copyright 2014, Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'memcached'

case node['platform_family']
when 'rhel'
  package 'libmemcached-devel'
else
  package 'libmemcache-dev'
end

service 'memcached' do
  action :nothing
  supports status: true, start: true, stop: true, restart: true
end

case node['platform_family']
when 'rhel'
  template '/etc/sysconfig/memcached' do
    source 'memcached.sysconfig.redhat.erb'
    owner 'root'
    group 'root'
    mode  '0644'
    variables(
      listen:      node['rackspace_memcached']['config']['-l']['value'],
      user:        node['rackspace_memcached']['config']['-u']['value'],
      port:        node['rackspace_memcached']['config']['-p']['value'],
      udp_port:    node['rackspace_memcached']['config']['-U']['value'],
      maxconn:     node['rackspace_memcached']['config']['-c']['value'],
      memory:      node['rackspace_memcached']['config']['-m']['value'],
      logfilename: node['rackspace_memcached']['config']['logfile']['value']
    )
    notifies :restart, 'service[memcached]'
  end
else
  template '/etc/memcached.conf' do
    source 'memcached.conf.erb'
    owner  'root'
    group  'root'
    mode   '0644'
    variables(
      config:          node['rackspace_memcached']['config']
    )
    notifies :restart, 'service[memcached]'
  end
end

template '/etc/logrotate.d/memcached' do
  source 'memcached.logrotate.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end
