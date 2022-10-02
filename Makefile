up: 
	docker-compose up -d database wordpress
down: 
	docker-compose down
wp-cli:
	docker-compose run --rm wordpress-cli $(cmd)
adminer-up:
	docker-compose up -d adminer
adminer-down:
	docker-compose rm -s -v adminer
wp-plugins:
	make wp-cli cmd="plugin install wp-graphql custom-post-type-ui"
	make wp-cli cmd="plugin activate wp-graphql custom-post-type-ui"
