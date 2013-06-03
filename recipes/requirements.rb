# Recipe that install all requirements

# Update apt-get
include_recipe "apt"

#
# Ruby 2.0 as system global ruby
#
include_recipe "ruby_build"
ruby_build_ruby "2.0.0-p195" do
  prefix_path "/usr/local/"
end

gem_package "bundler"
