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
include_recipe "coinz::crypto_coins"

# Run bundle install as vagrant user in /vagrant
bash "bundle install" do
  cwd "/vagrant"
  user "vagrant"
end

