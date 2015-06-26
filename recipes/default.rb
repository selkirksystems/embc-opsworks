#
# Cookbook Name:: embc
# Recipe:: default
#
# Copyright (C) 2015 Selkirk Systems, Inc.
#
# All rights reserved - Do Not Redistribute
#

group "docker" do
  members "ec2-user"
end

include_recipe "docker"