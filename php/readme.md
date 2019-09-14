# PHP images
These images can be build into container from image folder with command `bash docker.sh start`.

## Structure
* `docker.sh` - script for working with container
* `bash docker.sh start` – build and startup container
* `bash docker.sh stop` – shutdown container
* `bash docker.sh ssh` – ssh login to container
    * can be used for working with npm and Composer inside of container
* `docker-compose.yml` – basic configuration of container 
* `phpinfo.php` – information about PHP and its extensions
* `.docker/`
    * `Dockerfile` – installation of applications and libraries to container
    * `php.ini` – PHP setup
    * `apache.conf` – setup of Apache server

