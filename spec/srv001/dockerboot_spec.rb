package 'spec_helper'

describe file('/lib/systemd/system/dockerboot.service') do 
    it { should be_file }
end

describe file('/usr/bin/dockerboot') do
    it { should be_file }
end

describe file('/var/lib/dockerboot.db') do
  it { should be_file }
end
