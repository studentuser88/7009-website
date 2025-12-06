# Change your SID to your own one
SID=16102228
NAME=7009_webserver

ALL:
	docker-compose -f ../docker-compose.yml build webserver

run:
	docker-compose -f ../docker-compose.yml up -d webserver

clean:
	docker-compose -f ../docker-compose.yml down

scan:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasecurity/trivy:latest image $(SID)/$(NAME)_i

