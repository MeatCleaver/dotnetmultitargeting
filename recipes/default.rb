#
# Cookbook Name:: DotNetMultiTargeting
# Recipe:: default
#

cookbook_file "netfx_dtp.cab" do
	path "c:\\"
	action :crate_if_missing
end

cookbook_file "netfx_dtp.msi" do
	path "c:\\"
	action :crate_if_missing
end

execute "install_it" do
	command "NetFx_DTP.msi EXTUI=1 /log \"netfx_dtp.txt\""
	not_if { ::File.exists?("c:\\netfx_dtp.txt")}
end