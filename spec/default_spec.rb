require 'chefspec'

describe 'The recipe ps2dev::default' do
  let (:chef_run) do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set['platform_family'] = 'debian'
    chef_run.converge 'ps2dev::default'
    chef_run
  end

  %w(build-essential git).each do |recipe|
    it "should include the recipe #{recipe}" do
      chef_run.should include_recipe recipe
    end
  end

  %w(wget).each do |pkg|
    it "should install the package #{pkg}" do
      chef_run.should install_package pkg
    end
  end

  # TODO check for git resource
  it 'should clone the toolchain from GitHub'

  it 'should execute the toolchain script' do
    chef_run.should execute_command './toolchain-sudo.sh'
  end

  it 'should delete the temporary directory' do
    chef_run.should delete_directory \
      File.join(Chef::Config[:file_cache_path], 'ps2dev')
  end

  it 'should create the cookbook file /etc/profile.d/ps2dev.sh' do
    chef_run.should create_cookbook_file '/etc/profile.d/ps2dev.sh'
  end
end
