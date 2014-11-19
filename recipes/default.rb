include_recipe "docker"

# Pull docker image
docker_image node[:orientdb][:docker_image] do
	tag node[:orientdb][:docker_image_tag]
	action :pull
end

# Cread volumens directory
directory node[:orientdb][:config_path] do
	recursive true
	action :create
end
directory node[:orientdb][:databases_path] do
	recursive true
	action :create
end
directory node[:orientdb][:backup_path] do
	recursive true
	action :create
end

# Build the configuration
root_password = get_root_password()
template "#{node[:orientdb][:config_path]}/orientdb-server-config.xml" do
	source "orientdb-server-config.xml.erb"
	variables :config => {
		:root_password => root_password
		:server => node[:orientdb][:server]
	}
	action :create
end

# Run the docker container
docker_container "orientdb" do
	action :run
	image node[:orientdb][:docker_image]
	container_name node[:orientdb][:docker_container]
	detach true
	port ['2424:2424', '2480:2480']
	volume [
		"#{node[:orientdb][:config_path]}:/opt/orientdb/config", 
		"#{node[:orientdb][:databases_path]}:/opt/orientdb/databases", 
		"#{node[:orientdb][:backup_path]}:/opt/orientdb/backup" ]
end

