#
# Cookbook Name:: laravel_vagrant
# Recipe:: default
#
# Copyright (c) 2016 Daniel Bingham, All Rights Reserved.

include_recipe  'apt::default'
include_recipe  'apache2::default'
include_recipe  'php::default'
include_recipe  'php::module_mysql'
include_recipe  'php-mcrypt::default'
include_recipe  'composer::default'
include_recipe  'phpunit::default'
include_recipe  'apache2::mod_php5'
include_recipe  'laravel_vagrant::web'
include_recipe  'laravel_vagrant::php'
include_recipe  'laravel_vagrant::laravel_configuration'
include_recipe  'laravel_vagrant::composer'
include_recipe  'laravel_vagrant::database'
# Uncomment this when you have a database schema you want to load
# from an sql file.  See recipe for configuration variables that 
# will need to be set.
# include_recipe  'laravel_vagrant::database_schema'
