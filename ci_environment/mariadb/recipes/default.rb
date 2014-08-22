apt_repository "mercurial-ppa" do
  uri          "http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu"
  distribution node['lsb']['codename']
  components   ["main"]
  key          "0xcbcb082a1bb943db"
  keyserver    "keyserver.ubuntu.com"

  action :add
end

package "mariadb-server"