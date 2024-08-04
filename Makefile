init: docker-down-clear \
	app-clear docker-pull docker-build docker-up composer-install app-init

docker-down-clear:
	docker compose down -v --remove-orphans

app-clear:
	docker run --rm -v ${PWD}/:/app -w /app alpine sh -c 'rm -rf storage/logs/* bootstrap/cache/*'

composer-install:
	docker compose run --rm php-cli composer install

docker-pull:
	docker compose pull

docker-build:
	docker compose build --pull

docker-up:
	docker compose up -d

app-init:
	docker compose run --rm php-cli composer app-init

#fixtures:
#	docker compose run --rm php-cli composer app fixtures:load
