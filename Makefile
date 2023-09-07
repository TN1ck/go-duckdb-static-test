.PHONY: docker-build
docker-build:
	docker build \
		-t goduckdbstatic \
		-f Dockerfile \
		.

.PHONY: docker-run
docker-run:
	docker run goduckdbstatic