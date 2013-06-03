#
# Cookbook Name:: coinz
# Recipe:: development
#
# Recipe that sets up a Virtual development machine
#
# This recipe should only contain statements that are needed for vagrant/development
# and NOT needed for production

include_recipe "coinz::requirements"
include_recipe "coinz::database"

# Run bundle install as sudo in /vagrant
execute "bundle install" do
  cwd "/vagrant"
end