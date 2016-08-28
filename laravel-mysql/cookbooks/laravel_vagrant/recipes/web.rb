#
# Cookbook Name:: development
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Append the vagrant user to the www-data group. This will allow us to modify
# the source directory when we're sshed into the vagrant.   
group 'www-data' do
    action :modify
    members 'vagrant'
    append  true
end
    
# Create the virtual host configuration file.
web_app node['laravel_vagrant']['site_name'] do
    server_name node['laravel_vagrant']['server_name']
    server_aliases [node['fqdn']] + node['laravel_vagrant']['server_aliases']
    allow_override 'all'
    docroot node['laravel_vagrant']['document_root'] 
    cookbook 'apache2' 
end
