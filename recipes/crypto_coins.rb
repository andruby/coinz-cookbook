
include_recipe "crypto-coin::default"

# Compile & setup litecoind
crypto_coin "litecoin" do
  repository    "https://github.com/litecoin-project/litecoin.git"
  revision      "0.6.3"
  port          9333
  rpcpassword   "nojxxq2rryghg1p0ti7x"
end

service "litecoind" do
  provider Chef::Provider::Service::Upstart
  action :start
end
