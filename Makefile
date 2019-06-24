.PHONY: all clean build image run

NAME=thebeachcfp
VERSION=1.0.0

clean: 
	rm -f $(NAME)

build: clean
	CGO_ENABLED=0 go build -a -installsuffix cgo -o $(NAME)

image: 
	docker build -t=$(NAME):$(VERSION) .

run: 
	docker run -d -p 8080:8080 --name $(NAME) $(NAME):$(VERSION)