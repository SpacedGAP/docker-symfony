composer-install:
	docker run --rm -v $$PWD:/app -v ~/.ssh:/root/.ssh -u 1000 composer/composer install

docker-network-create:
	docker network create myapp

docker-network-rm:
	docker network rm myapp

docker-build:
	docker-compose -p app up --build --force-recreate -d nginx

docker-stop:
	docker stop `docker-compose -p app ps -q`

docker-rm: docker-stop
	docker-compose -p app rm -s

docker-php-fpm-bash:
	docker-compose -p app exec php-fpm /bin/bash

docker-node-sh:
	docker-compose -p app run -u 1000 node /bin/sh

app-database-create:
	docker-compose -p app exec --user 1000 php-fpm php bin/console doctrine:database:create

app-encore-dev:
	docker-compose -p app run -u 1000 node yarn run encore dev

app-encore-dev-watch:
	docker-compose -p app run -u 1000 node yarn run encore dev -- --watch

app-encore-prod:
	docker-compose -p app run -u 1000 node yarn run encore production

first-build: docker-network-create composer-install docker-build app-database-create

kill: docker-rm docker-network-rm
