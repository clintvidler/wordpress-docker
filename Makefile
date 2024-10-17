up: 
	docker-compose up -d database wordpress; make logs;
down: 
	docker-compose down
rl: 
	make down; sleep 1.0; make up; make logs;
logs:
	docker-compose logs -f wordpress;
wp-cli:
	docker-compose run --rm wordpress-cli $(cmd)
adminer-up:
	docker-compose up -d adminer
adminer-down:
	docker-compose rm -s -v adminer
wp-plugins:
	make wp-cli cmd="plugin install wp-graphql custom-post-type-ui"
	make wp-cli cmd="plugin activate wp-graphql custom-post-type-ui"
