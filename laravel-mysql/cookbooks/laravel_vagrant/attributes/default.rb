
#######################################
#   General Configuration
#######################################

# The root directory for Forest to Farm's source, a vagrant share directory.
default['laravel_vagrant']['source_directory'] = '/srv/www/application'
default['laravel_vagrant']['config_directory'] = '/srv/www/application/app/config'
default['laravel_vagrant']['secret_key'] = 'abcdefghijklmnop'

#######################################
#   PHP Configuration
#######################################

default['laravel_vagrant']['php']['config_file_path'] = '/etc/php5/apache2/php.ini'

# This is necessary to fix an issue in the php-mcrypt cookbook.  For some
# reason it didn't seem to gain access to this value from the php cookbook. I'm
# not sure if it was getting overriden somewhere or if recipes just don't
# necessarily gain access to each other's attributes, but for whatever reason,
# this fixed it.
override['php']['ext_conf_dir'] = '/etc/php5/mods-available'


#######################################
#   Apache2 Configuration 
#######################################

default['laravel_vagrant']['site_name'] = 'laravel_vagrant'
default['laravel_vagrant']['server_name'] = 'application.local'

# Note: server_aliases must be an array
default['laravel_vagrant']['server_aliases'] = ['www.application.local'] 
default['laravel_vagrant']['document_root'] = '/srv/www/laravel_vagrant/public/'


#######################################
#   MySQL Database Configuration 
#######################################

# This code isn't intended for anything other than local development on a
# vagrant box connected only to a local private network.  It should never, ever
# be run on production servers, and if it is, it will likely break many things.
# Thus, we aren't going to go to any great lengths to choose secure passwords
# or encrypt them in data bags or anything like that.
default['laravel_vagrant']['database']['root_password'] = 'password'
default['laravel_vagrant']['database']['host'] = '127.0.0.1'

default['laravel_vagrant']['database']['name'] = 'laravel_vagrant'

default['laravel_vagrant']['database']['username'] = 'developer'
default['laravel_vagrant']['database']['password'] = 'developing'

default['laravel_vagrant']['database']['data_directory'] = '/srv/www/laravel_vagrant/data/'
default['laravel_vagrant']['database']['schema_file'] = 'schema.sql'
default['laravel_vagrant']['database']['test_table'] = 'users'

