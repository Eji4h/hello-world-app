init:
	docker-compose -f docker-compose.init.yaml up

clean:
	sudo rm -rf node_modules dist yarn.lock

start-dev:
	docker-compose up -d

start-dev-rebuild:
	docker-compose up -d --build

down-dev:
	docker-compose down

restart-dev:
	docker-compose down && docker-compose up -d

restart-dev-rebuild:
	docker-compose down && docker-compose up -d --build

logs-dev:
	docker-compose logs -f

start-staging:
	docker-compose -f docker-compose.staging.yaml up -d

down-staging:
	docker-compose -f docker-compose.staging.yaml down

restart-staging:
	docker-compose -f docker-compose.staging.yaml down && docker-compose -f docker-compose.staging.yaml up -d

logs-staging:
	docker-compose -f docker-compose.staging.yaml logs -f

start-prod:
	docker-compose -f docker-compose.prod.yaml up -d

down-prod:
	docker-compose -f docker-compose.prod.yaml down

restart-prod:
	docker-compose -f docker-compose.prod.yaml down && docker-compose -f docker-compose.prod.yaml up -d

logs-prod:
	docker-compose -f docker-compose.prod.yaml logs -f
