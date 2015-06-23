#
# Cookbook Name:: embc
# Recipe:: install_resourcerequestservice
#
# Copyright (C) 2015 Selkirk Systems, Inc.
#
# All rights reserved - Do Not Redistribute
#

docker_image 'selkirksystems/embc-resourcerequest' do
  tag '0.0.2-SNAPSHOT'
  notifies :redeploy, 'docker_container[resourcerequestservice]', :immediately
end

docker_container 'resourcerequestservice' do
  action :run
  detach true
  container_name 'resourcerequestservice'
  image 'selkirksystems/embc-resourcerequest:0.0.2-SNAPSHOT'
  port '8080:80'
  restart 'always'
end