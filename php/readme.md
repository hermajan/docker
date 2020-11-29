# PHP images

* original images - <https://hub.docker.com/_/php>

## Build
These images can be build into container from parent folder of this file with command:

`bash docker.sh __FOLDER_NAME__ start`

For example `__FOLDER_NAME__` could be `php/7.4` for running PHP 7.4.  

## Structure
* `docker-compose.yml` – basic configuration of container 
* `phpinfo.php` – information about PHP and its extensions
* `.docker/`
    * `Dockerfile` – installation of applications and libraries to container
    * `php.ini` – PHP setup
    * `apache.conf` – setup of Apache server

