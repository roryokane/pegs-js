.PHONY: serve
serve: node_modules
	yarn start

.PHONY: build
build: node_modules
	yarn run build-production

dist: build

.PHONY: deploy
deploy: dist
	./deploy.sh

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
