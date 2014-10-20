# orientdb-docker-cookbook

Installs and configures OrientDb as a Docker container

## Supported Platforms

Platforms that support docker

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['orientdb']['docker_image']</tt></td>
    <td>String</td>
    <td>The docker image of orientdb that you want to use</td>
    <td><tt>ioinformatics/orientdb</tt></td>
  </tr>
  <tr>
    <td><tt>['orientdb']['docker_image_tag']</tt></td>
    <td>String</td>
    <td>The specific tag of the docker image to use</td>
    <td><tt>latest</tt></td>
  </tr>
  <tr>
    <td><tt>['orientdb']['docker_container']</tt></td>
    <td>String</td>
    <td>The name used for the new docker container</td>
    <td><tt>orientdb</tt></td>
  </tr>
  <tr>
    <td><tt>['orientdb']['config_path']</tt></td>
    <td>String</td>
    <td>The path to use as docker volume for configuration files</td>
    <td><tt>/etc/oriendb</tt></td>
  </tr>
  <tr>
    <td><tt>['orientdb']['databases_path']</tt></td>
    <td>String</td>
    <td>The path to use as docker volume for databases files</td>
    <td><tt>/var/data/orientdb/databases</tt></td>
  </tr>
  <tr>
    <td><tt>['orientdb']['backup_path']</tt></td>
    <td>String</td>
    <td>The path to use as docker volume for backup files</td>
    <td><tt>/var/backup/orientdb</tt></td>
  </tr>
</table>

### Configuration of root password

1) You can define the root password using the node attribute `['orientdb']['root_password']`

2) Or you can create an encripted databag `secrets` and databag item `orientdb` with the following content:

```json
{
  "id": "orientdb",
  "root_password": "MY_PASSWORD_!"
} 
```

3) Otherwise, if you don't do any of the above a random root password will be created.


## Usage

### orientdb-docker::default

Include `orientdb-docker` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[orientdb-docker]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Alexander De Leon (<@alexjdl>)
