#
# Cookbook Name:: laravel_vagrant
# Recipe:: database_schema
#
# An example cookbook showing how to import a database's schema from
# straight SQL files into the database.
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


schema_path = File.join(node['laravel_vagrant']['database']['data_directory'], node['laravel_vagrant']['database']['schema_file'])

# Cache some of the attributes we need to keep this marginally readable.
host = node['laravel_vagrant']['database']['host']
username = node['laravel_vagrant']['database']['username']
password = node['laravel_vagrant']['database']['password']
database_name = node['laravel_vagrant']['database']['name']

execute "Import database schema" do
  command "mysql -h #{host} -u #{username} -p#{password} -D #{database_name} < #{schema_path}"
  not_if  "mysql -h #{host} -u #{username} -p#{password} -D #{database_name} -e 'describe plants;'"
end
