#
# Cookbook:: myiis
# Recipe:: server.rb
#
# Copyright:: 2018, The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello World</h1>
  <h2>Platform: #{node['platform']}</h2>
  <h2>HOSTNAME: #{node['hostname']}</h2>
  <h2>Memory: #{node['memory']['total']}</h2>
  <h2>CPU mhz: #{node['cpu']['0']['mhz']}</h2>"
end

service 'w3svc' do
  action [:enable, :start]
end
