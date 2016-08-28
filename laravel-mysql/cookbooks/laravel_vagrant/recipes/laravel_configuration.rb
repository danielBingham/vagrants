#
# Cookbook Name:: laravel_vagrant
# Recipe:: laravel_configuration
#
# This recipe writes laravel configuration files from templates in the cookbook
# repo.  Generally, you want to leave configuration files out of your git repo,
# because you don't want to accidentially overwrite your production
# configuration files or the configuration files of your colleagues. 
#
# This code keeps configuration files in templates and writes them to the right
# location at the time of vagrant provisioning.  It populates them with values
# supplied in node attributes, that are also used to provision the rest of the
# server.
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



database_file = File.join(node['laravel_vagrant']['config_directory'], 'database.php')
template database_file do
   source  'config/database.php.erb'
   owner   'www-data'
   group   'www-data'
   mode     '0755'
   variables(
       :host    =>  node['laravel_vagrant']['database']['host'],
       :name    =>  node['laravel_vagrant']['database']['name'],
       :username => node['laravel_vagrant']['database']['username'],
       :password => node['laravel_vagrant']['database']['password']
   )
end

app_file = File.join(node['laravel_vagrant']['config_directory'], 'app.php')
template app_file do
    source  'config/app.php.erb'
    owner   'www-data'
    group   'www-data'
    mode    '0755'
    variables(
        :url    =>  node['laravel_vagrant']['server_name'],
        :secret_key =>  node['laravel_vagrant']['secret_key']
    )
end

config_files = ['auth.php', 'cache.php',  'mail.php', 'session.php', 'view.php']
config_files.each do |config_file|
    file = File.join(node['laravel_vagrant']['config_directory'], config_file );
    source_template = File.join('config', config_file);
    source_template << '.erb'
    template file do
        source  source_template
        owner   'www-data'
        group   'www-data'
        mode    '0755'
    end
end

testing_environment_path = File.join(node['laravel_vagrant']['config_directory'], 'testing')
directory testing_environment_path do
    owner   'www-data'
    group   'www-data'
    recursive   true
end

config_files = ['testing/session.php', 'testing/cache.php']
config_files.each do |config_file|
    file = File.join(node['laravel_vagrant']['config_directory'], config_file );
    source_template = File.join('config', config_file);
    source_template << '.erb'
    template file do
        source  source_template
        owner   'www-data'
        group   'www-data'
        mode    '0755'
    end
end
