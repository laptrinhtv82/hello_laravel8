all: build run

build:
	docker-compose2 -f ci/docker/docker-compose.yml build --no-cache --build-arg hostUID=1000 --build-arg hostGID=1000 web

start: run

run:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 up -d web

stop:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 kill

destroy:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 down

logs:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 logs -f web

shell:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 exec --user nginx web bash

root:
	docker-compose2 -f ci/docker/docker-compose.yml -p laravel8 exec web bash

ip:
	docker inspect laravel8-web | grep \"IPAddress\"

