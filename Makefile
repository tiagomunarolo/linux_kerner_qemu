all: docker_build docker_run

docker_prune:
	echo "##### PRUNING DOCKER #####"
	docker system prune --force

docker_run:
	echo "##### RUNNING DOCKER #####"
	docker run -it kernel-image

docker_build:
	echo "##### BUILDING DOCKER #####"
	docker build . -t kernel-image
