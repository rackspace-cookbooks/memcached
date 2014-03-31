require 'spec_helper'

describe 'rackspace_memcached::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the memcached package' do
    expect(chef_run).to install_package('memcached')
  end

  it 'creates memcached service with :nothing action' do
    expect(chef_run).to_not start_service('memcached')
    expect(chef_run).to_not enable_service('memcached')
  end

  context 'on rhel' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'redhat', version: '6.4').converge(described_recipe) }
    let(:template) { chef_run.template('/etc/sysconfig/memcached') }

    it 'installs libmemcached-devel package'do
      expect(chef_run).to install_package('libmemcached-devel')
    end

    it 'writes the /etc/sysconfig/memcached' do
      expect(chef_run).to create_template('/etc/sysconfig/memcached').with(
        user: 'root',
        group: 'root',
        mode: '0644'
      )
    end

    it 'notifies the service to restart' do
      expect(template).to notify('service[memcached]').to(:restart)
    end
  end

  context 'on ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }
    let(:template) { chef_run.template('/etc/memcached.conf') }

    it 'installs libmemcache-dev package'do
      expect(chef_run).to install_package('libmemcache-dev')
    end

    it 'writes the /etc/memcached.conf' do
      expect(chef_run).to create_template('/etc/memcached.conf').with(
        user: 'root',
        group: 'root',
        mode: '0644'
      )
    end

    it 'notifies the service to restart' do
      expect(template).to notify('service[memcached]').to(:restart)
    end
  end

end
