
build:
	docker build -t dockerbuilder .

tag:
	docker tag dockerbuilder progrium/dockerbuilder

test:
	tar -C ./example -cf - . | docker run -i -a stdin -a stdout -v /var/run/docker.sock:/tmp/docker.sock dockerbuilder dockerbuilder-test
	docker run dockerbuilder-test
	docker rmi dockerbuilder-test