init: clear docker-pull docker-build docker-up composer-install

clear:
	docker run --rm -v ${PWD}/:/app -w /app alpine sh -c 'rm -rf storage/logs/* bootstrap/cache/*'

composer-install:
	docker compose run --rm php-cli composer install

docker-pull:
	docker compose pull

docker-build:
	docker compose build --pull

docker-up:
	docker-compose up -d

#migrations:
#	docker compose run --rm php-cli composer app migrations:migrate -- --no-interaction
#
#fixtures:
#	docker compose run --rm php-cli composer app fixtures:load
