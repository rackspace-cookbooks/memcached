rackspace_memcached Cookbook
==================

Installs memcached and provides a template for its main configuration file.

Requirements
------------

### Platforms
- CentOS 6.4
- Ubuntu 12.04
- Debian 7.2

May work on other systems with or without modification.

### Cookbooks
This cook book does not depend on any other cookbooks

Attributes
----------
The following are node attributes passed to the template:

- `['rackspace_memcached']['memory']` - maximum memory for memcached instances.
- `['rackspace_memcached']['user']` - user to run memcached as.
- `['rackspace_memcached']['port']` - TCP port for memcached to listen on.
- `['rackspace_memcached']['udp_port']` - UDP port for memcached to listen on.
- `['rackspace_memcached']['listen']` - IP address for memcache to listen on, defaults to **0.0.0.0** (world accessible).
- `['rackspace_memcached']['maxconn']` - maximum number of connections to accept (defaults to 1024)
- `['rackspace_memcached']['max_object_size']` - maximum size of an object to cache (defaults to 1MB)
- `['rackspace_memcached']['logfilename']` - logfile to which memcached output will be redirected in /var/log/$logfilename.


Usage
-----
Simply set the attributes and it will configure the `/etc/memcached.conf` file. If you want to use multiple memcached instances, you'll need to modify the recipe to disable the startup script and the template in the default recipe.

The recipe also reads in whether to start up memcached from a `/etc/default/memcached` "ENABLE_MEMCACHED" setting, which is "yes" by default.


License & Authors
-----------------
- Author:: Joshua Timberman (<joshua@opscode.com>)
- Author:: Joshua Sierles (<joshua@37signals.com>)
- Author:: Kent Shultz (<kent.shultz@rackspace.com>)

```text
Copyright:: 2009-2012, Opscode, Inc
Copyright:: 2009, 37signals
Copyright:: 2014, Rackspace, US Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
