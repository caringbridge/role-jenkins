#
# Cookbook Name:: role-jenkins
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

# Installing ANT
%w(ant).each do |rpm|
  package rpm do
    action :install
  end
end

# Installing the following plugins
%w(checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations warnings xunit).each do |plugin|
  jenkins_plugin plugin do
    action :install
  end
end
