REPOS=$(USERNAME)/cross-debian
USERNAME=$(shell docker info 2> /dev/null | sed '/Username:/!d;s/.* //')

all:
	docker build -t $(REPOS) .

clean:
	docker rmi --force $(REPOS)

.PHONY: all clean
