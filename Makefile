init: docker-down docker-pull docker-build docker-up
up: docker-up
down: docker-down
restart: docker-down docker-up
clear: docker-down-clear

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down -v --remove-orphans

docker-down-clear:
	docker-compose down --rmi all -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build --pull

# build: build-gateway build-frontend build-api

# build-gateway:
# 	docker --log-level=debug build --pull --file=gareway/docker/production/nginx/Dockerfile --tag=${REGISTRY}/gareway:${IMAGE_TAG} gateway/docker/production/nginx 

# build-frontend:
# 	docker --log-level=debug build --pull --file=frontend/docker/production/nginx/Dockerfile --tag=${REGISTRY}/frontend:${IMAGE_TAG} frontend 

# build-api:
# 	docker --log-level=debug build --pull --file=api/docker/production/php-fpm/Dockerfile --tag=${REGISTRY}/php_fpm:${IMAGE_TAG} api
# 	docker --log-level=debug build --pull --file=api/docker/production/nginx/Dockerfile --tag=${REGISTRY}/nginx:${IMAGE_TAG} api

# try-build:
# 	REGISTRY=localhost IMAGE_TAG=0 make build