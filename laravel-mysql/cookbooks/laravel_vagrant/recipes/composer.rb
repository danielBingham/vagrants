#
# Cookbook Name:: laravel_vagrant
# Recipe:: composer
#
# Refresh laravel's generated autoload files and install any composer
# dependencies.  You may have to increase the memory on your vagrant box for
# this recipe to complete.  Composer's a memory hog.
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

composer_project node['laravel_vagrant']['source_directory'] do
    quiet   false
    action  :dump_autoload
end

composer_project node['laravel_vagrant']['source_directory'] do
    dev     true
    quiet   false
    action  :install
end
