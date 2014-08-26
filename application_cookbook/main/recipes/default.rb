application_dir = "/home/vagrant/application"
#Clean up
bash "remove old directory" do
  code "rm -rf /home/vagrant/application"
  user "root"
  cwd "/home/vagrant/"
  only_if { ::File.exists?(application_dir) }
end

directory "/home/vagrant/application" do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
end

git "/home/vagrant/application/django_app" do
  repository "https://github.com/sharma-mohit/django-travis-heroku"
  revision "master"
  user "vagrant"
  action :sync
end

bash "install python packages" do
  code "pip install -r requirements.txt"
  cwd "/home/vagrant/application/django_app"
  user "root"
end

#bash "start_website" do
#  code "python manage.py runserver 0.0.0.0:5000 &"
#  user "vagrant"
#  cwd "/home/vagrant/application/django_app"
#end
