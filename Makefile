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

docker_copy:
	echo "##### GETTING DOCKER BUILD FILES#####"
	docker stop $($(docker ps -q)
	docker run -it kernel-image
	docker cp $(docker ps -q):/work/build_files .
	docker stop $($(docker ps -q)

