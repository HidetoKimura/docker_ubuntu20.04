# Devlopment container using Ubuntu 20.04 

## Preconditions

- Ubuntu 24.04 LTS

- Install docker and docker compose, and add non-root docker user. 
  - https://docs.docker.com/engine/install/ubuntu/
  - https://docs.docker.com/engine/install/linux-postinstall/

## How to use

- If you'd like to change your work directory, please edit "setenv.sh"

- build container
~~~
$ . setenv.sh
$ docker compose build
~~~

- start container
~~~
$ . setenv.sh
$ docker compose up -d
~~~

- enter/re-enter container
~~~
$ docker compose exec app /bin/bash
~~~

- stop container
~~~
$ docker compose down
~~~

