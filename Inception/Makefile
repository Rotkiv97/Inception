NAME = Inception

#-f ./docker-compose.yml specifica il file di composizione
#up -d ovviamene up fa salire i comandi -d  indica che i 
#servizi dovrebbero essere eseguiti in modalità detached, 
#ovvero in background

all: $(NAME)

$(NAME):
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data/
#--force viene utilizzato per rimuovere in modo 
# forzato tutti i volumi Docker non utilizzati
fclean: 
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

.PHONY : Inception all down clean fclean re