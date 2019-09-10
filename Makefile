.PHONY: serve
serve: node_modules
	npm start

.PHONY: build
build: node_modules
	broccoli build dist

.PHONY: clean
clean:
	rm -rf dist

.PHONY: test
test: node_modules
	npm test

.PHONY: test-watch
test-watch: node_modules
	npm run test-watch

node_modules:
	npm install
