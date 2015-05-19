require 'spec_helper'


describe interface('eth0') do
  it { should exist }
  it { should be_up }
  it { should have_ipv4_address('192.168.100.2')}
end

describe file('/etc/resolv.conf') do 
    it { should be_file }
    it { should contain "nameserver 192.168.100.2"}
end

describe host('google.com') do
  it { should be_resolvable }
end

describe host('8.8.8.8') do
  it { should be_resolvable } 
end
