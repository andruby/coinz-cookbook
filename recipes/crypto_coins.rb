
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

# Extra dependency for namecoin
package "libglibmm-2.4-dev"

crypto_coin "namecoin" do
  repository    "https://github.com/namecoin/namecoin.git"
  revision      "nc0.3.51.00^{}"
  port          8334
  rpcport       7004
  rpcpassword   "32rfh3qr8rdbg4g4wa22"
end


crypto_coin "ppcoin" do
  repository    "https://github.com/ppcoin/ppcoin.git"
  revision      "4b084c3d984dd82b96013e9203ac08051971c733"
  port          9901
  rpcport       7005
  rpcpassword   "h2508kn13fctvs15jrge"
end

crypto_coin "digitalcoin" do
  repository    "https://github.com/baritus/digitalcoinSource.git"
  revision      "a87f041849aebf0d7cdef3a8df60115023a417cc"
  port          7999
  rpcport       7006
  rpcpassword   "2j81jt21g44k4yp9b9fg"
end


%w{litecoind bbqcoind worldcoind namecoind ppcoind digitalcoind}.each do |coind|
  service(coind) do
    provider Chef::Provider::Service::Upstart
    action :start
  end
end