require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe file('/usr/lib/rackspace-monitoring-agent/plugins/memcached_stats.py') do
  it { should be_file }
end
