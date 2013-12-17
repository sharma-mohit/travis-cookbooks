execute "set up d-apt" do
  command "wget http://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list"
  user "root"
  action :run
end

execute "install d-apt key" do
  command "apt-get update && apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && apt-get update"
  user "root"
  action :run
end

package "dmd-bin" do
  action :install
end

package "gdc" do
  action :install
end

package "dub" do
  action :install
end

package "libtango-dmd-dev" do
  action :install
end
