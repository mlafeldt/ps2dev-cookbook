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

tmpdir = File.join(Chef::Config[:file_cache_path], 'ps2dev')

# Install required Debian packages.
%w(build-essential git).each { |recipe| include_recipe recipe }

node['ps2dev']['install_packages'].each { |pkg| package(pkg) }

# Clone toolchain.
git tmpdir do
  repository node['ps2dev']['git']['repo']
  reference node['ps2dev']['git']['ref']
  depth 1
  action :sync
  not_if 'which ee-gcc iop-gcc ps2client && test -d /usr/local/ps2dev/ps2sdk'
end

# Build and install toolchain.
execute 'toolchain-sudo.sh' do
  user 'root'
  cwd tmpdir
  command './toolchain-sudo.sh'
  not_if 'which ee-gcc iop-gcc ps2client && test -d /usr/local/ps2dev/ps2sdk'
end

# Clean up.
directory tmpdir do
  recursive true
  action :delete
  only_if "test -d #{tmpdir}"
end

# Set up environment variables.
cookbook_file '/etc/profile.d/ps2dev.sh' do
  mode '0644'
  action :create
end
