require "spec_helper"

describe "ps2dev::default" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:tmpdir) { File.join(Chef::Config[:file_cache_path], "ps2dev") }

  before do
    stub_command("test -d #{tmpdir}").and_return(false)
    stub_command("which ee-gcc iop-gcc ps2client && test -d /usr/local/ps2dev/ps2sdk").and_return(false)
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

  # TODO: check for git resource
  it "should clone the toolchain from GitHub"

  it "should execute the toolchain script" do
    chef_run.should run_execute "./toolchain-sudo.sh"
  end

  it "should delete the temporary directory" do
    stub_command("test -d #{tmpdir}").and_return(true)
    chef_run.should delete_directory tmpdir
  end

  it "should create the cookbook file /etc/profile.d/ps2dev.sh" do
    chef_run.should create_cookbook_file "/etc/profile.d/ps2dev.sh"
  end
end
