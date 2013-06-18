# Recipe that install all requirements

# Update apt-get
include_recipe "apt"

#
# Ruby 2.0 as system global ruby
#

# People part of the ruby group will be able to install gems and run bundler
group "ruby" do
  append true
  # TODO: parameterize this to the user that will run the app/bundler
  members "vagrant"
end


# Compile ruby 2.0.0 from source
include_recipe "ruby_build"
ruby_build_ruby "2.0.0-p195" do
  group "ruby"
  prefix_path "/usr/local/"
end

# Give users in the ruby group access to install/delete gems
bash "Set group write permission on ruby gem path" do
  code "chmod -R g+wt /usr/local/lib/ruby/gems/2.0.0"
end

# Install bundler with the correct ruby 2.0.0 gem binary
gem_package "bundler" do
  gem_binary "/usr/local/bin/gem"
end

