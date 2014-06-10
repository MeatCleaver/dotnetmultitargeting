#
# Cookbook Name:: DotNetMultiTargeting
# Recipe:: default
#

directory "c:\\chef_temp" do
	action :create
end

cookbook_file "netfx_dtp.cab" do
	path "c:\\chef_temp\\netfx_dtp.cab"
	action :create_if_missing
end

cookbook_file "netfx_dtp.msi" do
	path "c:\\chef_temp\\netfx_dtp.msi"
	action :create_if_missing
end

execute "install_it" do
	command "c:\\chef_temp\\netfx_dtp.msi EXTUI=1"
end

directory "c:\\chef_temp" do
	action :delete
end
