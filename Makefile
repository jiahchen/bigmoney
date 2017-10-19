#ENV varible set.

.PHONY: build clean publish deploy undeploy

DOCKERHUB_USERNAME  := bigmoneypro
DOCKERHUB_PASSWORD  :=
CONTAINER_NAME      := devenv
BUILD_DIR           := .

build: build_container publish

build_container:
	docker build -t $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME) $(BUILD_DIR)

publish:
	docker login -u $(DOCKERHUB_USERNAME) -p $(DOCKERHUB_PASSWORD)
	docker push $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME)

init: pull_container docker_run status

pull_container:
	docker pull $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME)

docker_run:
	docker run -dti --net=host --name $(CONTAINER_NAME) --privileged=true $(DOCKERHUB_USERNAME)/$(CONTAINER_NAME)

attach:
	docker exec -ti $(CONTAINER_NAME) bash

status:
	docker ps | grep $(CONTAINER_NAME)

clean:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	make status
