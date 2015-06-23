#
# Cookbook Name:: embc
# Recipe:: install_eureka
#
# Copyright (C) 2015 Selkirk Systems, Inc.
#
# All rights reserved - Do Not Redistribute
#

docker_image 'netflixoss/eureka' do
  tag '1.1.147'
  notifies :redeploy, 'docker_container[eureka]', :immediately
end

docker_container 'eureka' do
  action :run
  detach true
  container_name 'eureka'
  image 'netflixoss/eureka:1.1.147'
  port '8761:8080'
  restart 'always'
end