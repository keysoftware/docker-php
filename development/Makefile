NS        := keysoftware
NAME      := php
VERSION   := development
PORT_9000 := 9200

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
	docker run -d --name $(NS)_$(NAME)-$(VERSION) -p $(PORT_9000):9000 $(NS)/$(NAME):$(VERSION)
	docker ps -a
