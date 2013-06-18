# Recipe that install all requirements

# Update apt-get
include_recipe "apt"

#
# Ruby 2.0 as system global ruby
#

# Compile ruby 2.0.0 from source
include_recipe "ruby_build"
ruby_build_ruby "2.0.0-p195" do
  prefix_path "/usr/local/"
end

# Install bundler with the correct ruby 2.0.0 gem binary
gem_package "bundler" do
  gem_binary "/usr/local/bin/gem"
end

