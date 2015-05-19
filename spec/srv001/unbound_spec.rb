require 'spec_helper'

describe package('unbound') do
    it { should be_installed }
end

describe service('unbound') do
  it { should be_enabled }
  it { should be_running }
end

describe port('53') do
  it { should be_listening }
end

describe file('/etc/unbound/unbound.conf') do
  it { should be_file }
  it { should contain "do-ip6: no" }
  it { should contain "do-ip4: yes" }
  it { should contain "use-syslog: no" }
  it { should contain "interface: 0.0.0.0" }
  it { should contain "192.168.0.0/16 allow" }
end
