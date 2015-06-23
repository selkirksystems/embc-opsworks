#
# Cookbook Name:: embc
# Recipe:: default
#
# Copyright (C) 2015 Selkirk Systems, Inc.
#
# All rights reserved - Do Not Redistribute
#

#include_recipe "docker"
group "docker"
group "docker" do
  members "ec2-user"
end

case node[:platform]
  when "ubuntu","debian"
    package "docker.io" do
      action :install
    end
  when 'centos','redhat','fedora','amazon'
    package "docker" do
      action :install
    end
end

service "docker" do
  action :start
end

