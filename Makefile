.PHONY: serve
serve: node_modules
	yarn start

.PHONY: build
build: node_modules
	yarn run build-production

.PHONY: clean
clean:
	rm -rf dist

.PHONY: test
test: node_modules
	yarn test

.PHONY: test-watch
test-watch: node_modules
	yarn run test-watch

node_modules:
	yarn install
