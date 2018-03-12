#
# Cookbook:: myiis
# Recipe:: server.rb
#
# Copyright:: 2018, The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content '<h1>Hello World</h1>'
end

service 'w3svc' do
  action [:enable, :start]
end
