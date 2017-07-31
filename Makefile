composer-install:
	docker run --rm -v $$PWD:/app -v ~/.ssh:/root/.ssh -u 1000 composer/composer install

docker-build:
	docker-compose -p app up --build --force-recreate

docker-rm:
	docker-compose -p app rm -s

docker-php-fpm-bash:
	docker-compose -p app exec php-fpm /bin/bash

docker-create-database:
	docker-compose -p app exec php-fpm php bin/console doctrine:database:create
