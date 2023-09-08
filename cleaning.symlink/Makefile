.PHONY: empty cleanCaches cleanDocker clean

.DEFAULT_GOAL := empty

empty:
	echo "You must specify a target"

cleanCaches:
	python3 ./cleanCaches.py

cleanDocker:
	docker system prune --all --force


clean: cleanCaches cleanDocker
