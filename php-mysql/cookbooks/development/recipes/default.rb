#
# Cookbook Name:: development 
# Recipe:: default
# License:: MIT Open Source
#

include_recipe  'apt::default'
include_recipe  'development::apache2'
include_recipe  'development::mysql'
include_recipe  'development::php'
include_recipe  'composer::default'
