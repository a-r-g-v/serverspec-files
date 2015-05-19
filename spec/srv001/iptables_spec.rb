package 'spec_helper'

describe package('iptables-persistent') do
  it { should be_installed }
end

describe file('/etc/iptables/rules.v4') do 
    it { should be_file }
end
