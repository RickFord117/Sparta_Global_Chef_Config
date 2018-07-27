
describe port(27017), :skip do
  it { should be_listening }
  its('addresses') {should include '0.0.0.0'}
end

describe npm ('mongodb') do
  it { should be_installed }
  it { should be_running }
  it { should be_enabled }
end
