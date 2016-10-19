
#   General Configuration
#######################################

# The root directory for the application's source, a vagrant share directory.
default['development']['source_directory'] = '/srv/www/application'
default['development']['config_directory'] = '/srv/www/application/config'


#######################################
#   Apache2 Configuration 
#######################################

default['development']['server_name'] = 'application.local'
default['development']['server_alias'] = 'www.applicatoin.local'

default['development']['webmaster_email'] = 'webmaster@application.local'
default['development']['document_root'] = '/srv/www/application/public'

#######################################
#   MySQL Database Configuration 
#######################################

# This code isn't intended for anything other than local development on a
# vagrant box connected only to a local private network.  It should never, ever
# be run on production servers, and if it is, it will likely break many things.
# Thus, we aren't going to go to any great lengths to choose secure passwords
# or encrypt them in data bags or anything like that.
default['development']['database']['root_password'] = 'password'
default['development']['database']['host'] = '127.0.0.1'

default['development']['database']['development']['name'] = 'local_application'
default['development']['database']['development']['username'] = 'developer'
default['development']['database']['development']['password'] = 'developing'
