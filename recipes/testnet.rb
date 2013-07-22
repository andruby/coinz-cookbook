# "role" recipe for coin testnets

include_recipe "crypto-coin::default"

crypto_coin "bitcoin" do
  repository    "https://github.com/bitcoin/bitcoin.git"
  revision      "40809aed657502e9de158e2cfe2c659a316f2f90"
  port          18333
  rpcport       7001
  rpcpassword   "fa4rhioylwmmzfff"
  conf({
    testnet: 1,
    gen: 0
  })
end

crypto_coin "litecoin" do
  repository    "https://github.com/litecoin-project/litecoin.git"
  revision      "bf293d7b6ddebba22482a6ed3730731e481ccc94"
  port          19333
  rpcport       7002
  rpcpassword   "7a4kh3i2m9tfdxf7"
  conf({
    testnet: 1,
    gen: 0
  })
end

service "bitcoind" do
  provider Chef::Provider::Service::Upstart
  action :start
end

service "litecoind" do
  provider Chef::Provider::Service::Upstart
  action :start
end
