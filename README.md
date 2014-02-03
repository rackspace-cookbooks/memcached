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

- `['rackspace_memcached']['config']['-m']['value']`` - maximum memory for memcached instances, in MB. Default is 64.
- `['rackspace_memcached']['config']['-u']['value']`` - user to run memcached as.
- `['rackspace_memcached']['config']['-p']['value']`` - TCP port for memcached to listen on. Default is 11211.
- `['rackspace_memcached']['config']['-U']['value']`` - UDP port for memcached to listen on. Default is 11211.
- `['rackspace_memcached']['config']['-l']['value']`` - IP address for memcache to listen on, defaults to **0.0.0.0** (world accessible).
- `['rackspace_memcached']['config']['-c']['value']`` - maximum number of connections to accept. Defaults is 1024.
- `['rackspace_memcached']['config']['-I']['value']`` - maximum size of an object to cache. Default is 1MB.
- `['rackspace_memcached']['config']['logfile']['value']` - logfile to which memcached output will be redirected. Default is /var/log/memcached.log.


Usage
-----
Simply set the attributes and the cookbook will configure the `/etc/memcached.conf` file (Ubuntu, Debian) or /etc/sysconfig/memcached file (CentOS, RHEL). If you want to use multiple memcached instances, you'll need to modify the recipe to disable the startup script and the template in the default recipe.

To add an option to the /etc/memcached.conf file (Ubuntu/Debian) that does not have a default value from this cookbook and is not enabled/set by default in memcache, simply define a new attribute that follows the pattern of those in the Attributes section above. For example, to enable extra verbosity, add the following line to your recipe:

`node.default['rackspace_memcached']['config']['-vv']['value'] = true`

The template will render a line with content `-vv`. Note that for this example, you must set the value to boolean `true`, *not* a string `'true'`.

To add an option to the configuration that takes a value (e.g. `-m 128`), you must define the attribute like the following:

`node.default['rackspace_memcached']['config']['-m']['value'] = 128`


Contributing
------------
* See contributing guidelines [here](https://github.com/rackspace-cookbooks/contributing/blob/master/CONTRIBUTING.md)

Testing
-------
* See contributing guidelines [here](https://github.com/rackspace-cookbooks/contributing/blob/master/CONTRIBUTING.md)

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
