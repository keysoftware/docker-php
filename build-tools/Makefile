NS            := keysoftware
NAME          := php
VERSION       := build-tools
HOST_APP      := `pwd`/webapp
CONTAINER_APP := /srv/www/webapp
BUILDXML      := /config/build.xml
PORT_9000     := 9300

.PHONY: build
build:
	docker build -t $(NS)/$(NAME):$(VERSION) -f Dockerfile .

.PHONY: clean
clean:
	docker stop $(NS)_$(NAME)-$(VERSION)
	docker rm $(NS)_$(NAME)-$(VERSION)

.PHONY: clean-image
clean-image:
	docker rmi $(NS)/$(NAME)-$(VERSION)
	
.PHONY: exec
exec:
	docker exec -it $(NS)_$(NAME)-$(VERSION) bash

.PHONY: run
run:
	docker run -d --name $(NS)_$(NAME)-$(VERSION) \
										-v `pwd`/config:/config/ \
										-v `pwd`/scripts:/scripts/ \
										-v $(HOST_APP):$(CONTAINER_APP)/ \
										-e APP_DIR=$(CONTAINER_APP) \
										-e BUILDXML=$(BUILDXML) \
										$(NS)/$(NAME):$(VERSION)
	docker ps -a
