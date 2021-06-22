REPOS=cross-debian

all:
	docker build -t $(REPOS) .

clean:
	docker rmi --force $(REPOS)

.PHONY: all clean
