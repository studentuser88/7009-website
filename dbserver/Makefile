# Change your SID to your own one
SID=16102228
NAME=7009_dbserver

ALL:
	docker-compose -f ../docker-compose.yml build dbserver

run:
	docker-compose -f ../docker-compose.yml up -d dbserver

clean:
	docker-compose -f ../docker-compose.yml down

scan:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasecurity/trivy:latest image $(SID)/$(NAME)_i# Change your SID to your own one

