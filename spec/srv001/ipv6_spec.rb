require 'spec_helper'


describe interface('eth0') do
  # disable ipv6
  it { should_not have_ipv6_address("fe80::1") }
  it { should_not have_ipv6_address("fd00::1/48") }
end

describe file('/etc/default/grub') do
  it { should contain "ipv6.disable=1" }
end
