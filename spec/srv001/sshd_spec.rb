require 'spec_helper'

describe package('openssh-server') do
    it { should be_installed }
end

describe port('22') do
    it { should_not be_listening } end

describe service('ssh') do
    it { should be_enabled }
    it { should be_running }
end

# thanks to https://mrtc0.github.io/2015/05/07/sshd_config-template/
describe file('/etc/ssh/sshd_config') do

    it { should be_file }

    # Port22
    it { should_not contain "Port 22" }

    # I hate IPv6
    it { should contain "AddressFamily inet" }

    # Protocol
    it { should contain "Protocol 2" }

    # Security
    it { should contain "PermitRootLogin no" }
    it { should contain "StrictModes yes" }

    # Authentication
    it { should contain "PubkeyAuthentication yes" }
    it { should contain "HostbasedAuthentication no" }
    it { should contain "PermitEmptyPasswords no"}
    it { should contain "ChallengeResponseAuthentication no" }
    it { should contain "KerberosAuthentication no" }
    it { should contain "GSSAPIAuthentication no" }
    it { should contain "UsePAM no" }

    # Method
    it { should contain "AllowAgentForwarding no" }
    it { should contain "AllowTcpForwarding no" }
    it { should contain "GatewayPorts no" }
    it { should contain "X11Forwarding no" }
    it { should contain "sftp" }
end
