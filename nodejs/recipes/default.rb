#
# Cookbook:: nodejs
# Recipe:: default
#
# Copyright:: 2019, Calum Goodchild, All Rights Reserved.

#Apt Update
apt_update "daily" do
	frequency 86_400
	action :periodic
end

#Install packages
package 'nodejs'
#package 'npm'

#Loop through default attributes and install the node_modules
node['node_modules'].each do |packages|

	#Install Node Modules using execute resource
	execute "npm_install" do
		command "npm install #{packages}"
		action :run
	end

end

#Create node directory for app.js
directory '/var/node' do
	recursive true
	action :create
end
