# Cookbook Name:: development 
# Recipe:: apache2
# License:: MIT Open Source

package 'apache2' do
    action :install
end

# Append the vagrant user to the www-data group. This will allow us to modify
# the source directory when we're sshed into the vagrant.   
group 'www-data' do
    action :modify
    members 'vagrant'
    append  true
end

virtual_host_path = File.join('/etc/apache2/sites-available/', node['development']['server_name'])
virtual_host_path << '.conf'
template virtual_host_path do
    source  'virtual_host.conf.erb'
    owner   'root'
    group   'root'
    mode    '0755'
    variables({
        :server_name => node['development']['server_name'],
        :server_alias => node['development']['server_alias'],
        :webmaster_email => node['development']['webmaster_email'],
        :document_root => node['development']['document_root']
    })
end

execute 'Disable default site' do
    command 'a2dissite 000-default'
end

execute 'Enable ' + node['development']['server_name'] do
    command 'a2ensite ' + node['development']['server_name']
end

execute 'Restart apache2' do
    command 'service apache2 restart'
end

