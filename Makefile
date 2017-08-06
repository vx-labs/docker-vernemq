all: docker
docker:
	docker build  -t vxlabs/vernemq  .
