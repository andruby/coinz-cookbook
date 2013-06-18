#
# Postgresql
#
include_recipe "database"
include_recipe "postgresql::server"
include_recipe "postgresql::ruby"

postgresql_connection_info = {:host => "localhost",
                              :port => node['postgresql']['config']['port'],
                              :user => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

# Create database user and grant privileges
# Doing it manually because the LWRP's fail
ruby_block "Create db user with createdb privilege" do
  block do
    require 'pg'
    PGconn.open(postgresql_connection_info) do |conn|
      begin
        result = conn.exec "CREATE ROLE #{node['coinz']['db']['user']} WITH CREATEDB LOGIN PASSWORD '#{node['coinz']['db']['password']}'"
      rescue PG::Error => e
        Chef::Log.warn("Error creating db user: #{e.message.chomp}")
      end
    end
  end
end