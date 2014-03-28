#
# Cookbook Name:: rackspace_memcached
# Attributes:: default
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
default['rackspace_memcached']['templates_cookbook']['sysconfig'] = 'rackspace_memcached'
default['rackspace_memcached']['templates_cookbook']['memcached_conf'] = 'rackspace_memcached'
default['rackspace_memcached']['config']['-d'] = { value: true, comment: 'run as daemon' }
default['rackspace_memcached']['config']['logfile'] = { value: '/var/log/memcached.log' }
default['rackspace_memcached']['config']['-v'] = { value: true, comment: 'verbose output' }
default['rackspace_memcached']['config']['-m'] = { value: 64, comment: 'cache size' }
default['rackspace_memcached']['config']['-p'] = { value: '11211', comment: 'port' }
default['rackspace_memcached']['config']['-U'] = { value: '11211', comment: 'udp port' }
default['rackspace_memcached']['config']['-l'] = { value: '0.0.0.0', comment: 'listen address' }
default['rackspace_memcached']['config']['-c'] = { value: 1024, comment: 'maximum incoming connections' }
default['rackspace_memcached']['config']['-I'] = { value: '1m', comment: 'maximum object size' }
# default['rackspace_memcached']['config']['-vv'] = { value: true, comment: 'extra verbose'}
# default['rackspace_memcached']['config']['-k'] = { value: true, comment: 'lock down all paged memory'}
# default['rackspace_memcached']['config']['-M'] = { value: true, comment: 'return error when memory exhausted' }
# default['rackspace_memcached']['config']['-r'] = { value: true, comment: 'maximize core file limit' }

default['rackspace_memcached']['config']['-u']['comment'] = 'run as user instead of root'
case node['platform']
when 'redhat', 'centos'
  default['rackspace_memcached']['config']['-u']['value'] = 'memcached'
when 'ubuntu'
  default['rackspace_memcached']['config']['-u']['value'] = 'memcache'
else
  default['rackspace_memcached']['config']['-u']['value'] = 'nobody'
end

default['rackspace_memcached']['include_dev_lib'] = true
