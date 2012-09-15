tmp_dir = "/tmp/toolchain"

# Install required Debian packages.
%w(gcc git-core make patch wget).each do |pkg|
  package(pkg) do
    action :install
  end
end

# Clone toolchain.
git tmp_dir do
  repository "git://github.com/ps2dev/ps2toolchain.git"
  reference "master"
  depth 1
  action :sync
end

# Build and install toolchain.
execute "toolchain-sudo.sh" do
  user "root"
  cwd tmp_dir
  command "./toolchain-sudo.sh"
  not_if "which ee-gcc iop-gcc ps2client && test -d /usr/local/ps2dev/ps2sdk"
end

# Clean up.
directory tmp_dir do
  recursive true
  action :delete
end

# Set up environment variables.
cookbook_file "/etc/profile.d/ps2dev.sh" do
  mode 0644
  action :create
end
