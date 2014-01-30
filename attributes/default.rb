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

default['rackspace_memcached']['memory'] = 64
default['rackspace_memcached']['port'] = 11_211
default['rackspace_memcached']['udp_port'] = 11_211
default['rackspace_memcached']['listen'] = '0.0.0.0'
default['rackspace_memcached']['maxconn'] = 1024
default['rackspace_memcached']['max_object_size'] = '1m'
default['rackspace_memcached']['logfilename'] = 'memcached.log'

case node['platform_family']
when 'rhel'
  default['rackspace_memcached']['user'] = 'memcached'
  default['rackspace_memcached']['group'] = 'memcached'
when 'ubuntu'
  default['rackspace_memcached']['user'] = 'memcache'
  default['rackspace_memcached']['group'] = 'memcache'
when 'debian'
  default['rackspace_memcached']['user'] = 'nobody'
  default['rackspace_memcached']['group'] = 'nogroup'
else
  default['rackspace_memcached']['user'] = 'nobody'
  default['rackspace_memcached']['user'] = 'nogroup'
end
