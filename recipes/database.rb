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

# # Create database user
# postgresql_database_user(node['coinz']['db']['user']) do
#   connection postgresql_connection_info
#   password node['coinz']['db']['password']
#   action :create
# end

# Create database user and grant priviledges
# postgresql_database "Creat database user" do
#   pwd = node['coinz']['db']['password']
#   sql "CREATE ROLE #{node['coinz']['db']['user']} WITH CREATEDB LOGIN PASSWORD '#{pwd}'"
#   Chef::Log.error("SQL: #{sql}")
#   connection postgresql_connection_info
#   action :query
# end

# Create database user and grant priviledges
# Doing it manually because the LWRP's did not work
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