#
# Cookbook:: mongodb
# Recipe:: mongodb
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'mongodb'

service 'mongodb' do
  supports status: true, restart: true, reload: true
  action :enable, :start
end

template '/etc/mongodb.conf' do
  source 'mongodb.conf.erb'
  variables proxy_port: node['mongodb']['proxy_port']
  notifies :restart, 'service[mongodb]'
end
# comment
template '/lib/systemd/system/mongod.service' do
  source 'mongodb.service'
  variables proxy_port: node['mongodb']['proxy_port']
  notifies :restart, 'service[mongodb]'
end
