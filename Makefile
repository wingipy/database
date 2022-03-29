.PHONY: help

CMD ?= ''

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

start: ## Iniciar.
	@echo "Starting..."
	@docker-compose up -d

down: ## Detener todos los contenedores en ejecución .
	@echo "down..."
	@docker-compose down

down-all: ## Si necesita detener y eliminar todos los contenedores, redes y todas las imágenes utilizadas por cualquier servicio en el archivo.
	@echo "down all..."
	@docker-compose down --rmi all

database: ## Entrar a la base de datos.
	@echo "entrando a la base de datos..."
	@echo "mysql -u root -p"
	@docker exec -it db_mydiary sh

restart: ## reiniciar.
	@echo "Reiniciando..."
	@make down-all
	@make start