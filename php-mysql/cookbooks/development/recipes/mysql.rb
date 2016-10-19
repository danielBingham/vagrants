#
# Cookbook Name:: development 
# Recipe:: mysql 
# License:: MIT Open Source
#


# Install and configure the MySQL client.
mysql_client 'default' do
    action :create
end

# Install and configure the MySQL service.
mysql_service 'default' do
    initial_root_password node['development']['database']['root_password']
    action [:create,:start]
end

# Install the mysql2_chef_gem which is required by the mysql_database cookbook.
mysql2_chef_gem 'default' do
    action :install
end

# Let's hang on to the connection info so we don't have to repeat it.  It's
# pretty verbose.
connection_info = {
    :host => node['development']['database']['host'],
    :username => 'root',
    :password => node['development']['database']['root_password']
}

# create the development database instance
mysql_database node['development']['database']['development']['name'] do
    connection connection_info
    action :create
end

# Add a development database user
mysql_database_user node['development']['database']['development']['username'] do
    connection connection_info
    password node['development']['database']['development']['password']
    database_name node['development']['database']['development']['name']
    host node['development']['database']['host']
    action [:create,:grant]
end

