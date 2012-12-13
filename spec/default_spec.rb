require 'chefspec'

describe 'The recipe ps2dev::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'ps2dev::default' }

  %w(wget).each do |pkg|
    it "should install #{pkg}" do
      chef_run.should install_package pkg
    end
  end

  it 'should execute toolchain-sudo.sh' do
    chef_run.should execute_command './toolchain-sudo.sh'
  end

  it 'should delete directory /tmp/toolchain' do
    chef_run.should delete_directory '/tmp/toolchain'
  end

  it 'should create cookbook file /etc/profile.d/ps2dev.sh' do
    chef_run.should create_cookbook_file '/etc/profile.d/ps2dev.sh'
  end
end
