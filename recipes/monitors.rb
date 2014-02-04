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

directory '/usr/lib/rackspace-monitoring-agent/plugins/' do
  action :create
  only_if { node.recipes.include? 'rackspace_cloudmonitoring::agent' }
end

file '/usr/lib/rackspace-monitoring-agent/plugins/memcached_stats.py' do
  source 'memcached_stats.py'
  owner  'root'
  group  'root'
  mode   '0755'
  only_if { node.recipes.include? 'rackspace_cloudmonitoring::agent' }
end

# optionally specify alarm and notification_plan on a rolebook level
node.default['rackspace_cloudmonitoring']['monitors']['memcached_stats'] = { type: 'agent.plugin', details: { file: 'memcached_stats.py' } }
