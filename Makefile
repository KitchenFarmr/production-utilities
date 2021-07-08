compose = docker-compose

build :
				${compose} build --force-rm --no-cache

start :
				${compose} up -d

stop :
				${compose} down
				
debug :
				${compose} --verbose up

reload: stop start

start-watchtower :
				docker run -d \
                --name watchtower \
                -v /var/run/docker.sock:/var/run/docker.sock \
                containrrr/watchtower \
                --interval 30 \
				--cleanup

stop-watchtower :
				docker stop watchtower

rm-watchtower :
				docker rm watchtower

rmi-watchtower :
				docker rmi containrrr/watchtower
