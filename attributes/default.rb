default[:orientdb][:docker_image]="ioinformatics/orientdb"
default[:orientdb][:docker_image_tag]="latest"
default[:orientdb][:docker_container]="orientdb"
default[:orientdb][:config_path]="/etc/orientdb"
default[:orientdb][:databases_path]="/var/data/orientdb/databases"
default[:orientdb][:backup_path]="/var/backup/orientdb"

default[:orientdb][:server][:properties]['db.pool.min'] = 1
default[:orientdb][:server][:properties]['db.pool.max'] = 50
default[:orientdb][:server][:properties]['cache.local.enabled'] = true
default[:orientdb][:server][:properties]['profiler.enabled'] = true
default[:orientdb][:server][:properties]['log.console.level'] = "info"
default[:orientdb][:server][:properties]['log.file.level'] = "fine"
