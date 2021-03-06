#
# Cookbook Name:: rails_vagrant
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe  'apt::default'
include_recipe  'rails_vagrant::ruby'
include_recipe  'rails_vagrant::apache2'
include_recipe  'rails_vagrant::database'
include_recipe  'rails_vagrant::rails'
include_recipe  'rails_vagrant::configuration'
# If you want to load an existing sql schema file into the newly
# create database, uncomment this line.
# include_recipe  'rails_vagrant::database_schema'
include_recipe  'rails_vagrant::virtual_host'
# If you're using Grunt as a task runner, uncomment the
# lines below to install it and run npm install.
# include_recipe  'nodejs'
# include_recipe  'rails_vagrant::grunt'
