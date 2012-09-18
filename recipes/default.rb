#
# Cookbook Name:: ps2dev
# Recipe:: default
#
# Copyright (C) 2012 Mathias Lafeldt <mathias.lafeldt@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

tmp_dir = "/tmp/toolchain"

# Install required Debian packages.
%w(build-essential git).each do |recipe|
  include_recipe recipe
end

%w(wget).each do |pkg|
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
