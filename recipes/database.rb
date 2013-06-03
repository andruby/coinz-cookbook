#
# Postgresql
#
include_recipe "database"
include_recipe "postgresql::server"
include_recipe "postgresql::ruby"

postgresql_connection_info = {:host => "localhost",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

# Create database user
postgresql_database_user(node['coinz']['db']['user']) do
  connection postgresql_connection_info
  password node['coinz']['db']['password']
  action :create
end

# Grant user the right to create new databases
postgresql_database("GRANT create TO #{node['coinz']['db']['user']}") do
  connection postgresql_connection_info
  action :query
end

