# Use Berkshelf to install Chef cookbooks before running RSpec tests.
#
# Must be loaded inside the cookbook you want to test via "rspec --require".
#
# Written by Mathias Lafeldt <mathias.lafeldt@gmail.com>

if File.exists?("Berksfile")
  require 'bundler/setup'
  require 'chef/cookbook/metadata'
  require 'fileutils'

  metadata_file = "metadata.rb"
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file(metadata_file)

  cookbook_name = metadata.name.empty? ? File.basename(Dir.pwd) : metadata.name
  cookbooks_dir = File.expand_path(ENV['RSPEC_COOKBOOKS'] || "cookbooks")

  puts "  + Running Berkshelf to install cookbooks to #{cookbooks_dir}"
  FileUtils.rm_rf(cookbooks_dir)
  berks = Gem.bin_path("berkshelf", "berks")
  exit unless system(berks, "install", "--path", cookbooks_dir)
end
