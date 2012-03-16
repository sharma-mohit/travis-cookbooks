directory "#{node[:travis][:worker][:home]}" do
  action :create
  recursive true
  owner "travis"  
  group "travis"
  mode "0755"
end

git "#{node[:travis][:worker][:home]}" do
  repository node[:travis][:worker][:repository]
  reference node[:travis][:worker][:ref]
  action :sync
  user "travis"
  user "travis"
end

template "#{node[:travis][:worker][:home]}/config/worker.yml" do
  source "worker.yml.erb"
  owner "travis"
  group "travis"
  mode "0600"
  variables :amqp => node[:travis][:worker][:amqp],
            :env => node[:travis][:worker][:env],
            :vms => node[:travis][:worker][:vms]
end

rvm  = "source /usr/local/rvm/scripts/rvm && rvm"
bash "bundle gems" do
  code "#{rvm} 1.9.2 do bundle install --path vendor/bundle"
  user "travis"
  cwd node[:travis][:worker][:home]
end