# Start the server in development mode
run:
	@hugo server -D
.PHONY: run

# Build the website
build:
	@hugo
.PHONY: build
