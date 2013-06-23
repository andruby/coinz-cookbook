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

include_recipe "crypto-coin::default"

# Save cpu time & diskspace by running only one coin
# Digitalcoin is a fast coin (20s target time)
# with a relatively short blockchain (150K blocks in June 2013)
crypto_coin "digitalcoin" do
  repository    "https://github.com/baritus/digitalcoinSource.git"
  revision      "a87f041849aebf0d7cdef3a8df60115023a417cc"
  port          7999
  rpcport       7006
  rpcpassword   "2j81jt21g44k4yp9b9fg"
end

service "digitalcoind" do
  provider Chef::Provider::Service::Upstart
  action :start
end
