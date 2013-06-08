
include_recipe "crypto-coin::default"

crypto_coin "litecoin" do
  repository    "https://github.com/litecoin-project/litecoin.git"
  revision      "0.6.3"
  port          9333
  rpcport       7001
  rpcpassword   "npdbkbq9t6x9vt558qr9"
end

crypto_coin "bbqcoin" do
  repository    "https://github.com/overware/BBQCoin.git"
  revision      "b742b74481598e5e3dc104fa6be62ab04cf2b7ff"
  port          59332
  rpcport       7002
  rpcpassword   "5n0g6r5z5w9pazeurqb6"
end

crypto_coin "worldcoin" do
  repository    "https://github.com/worldcoinproject/Worldcoin.git"
  revision      "2d35dc4ba7365a1873e8c0523dbae483058779f8"
  port          11081
  rpcport       7003
  rpcpassword   "mtrvhninryeu53wzmczc"
end

%w{litecoind bbqcoind worldcoind}.each do |coind|
  service(coind) do
    provider Chef::Provider::Service::Upstart
    action :start
  end
end