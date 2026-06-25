.ONESHELL:
MAKEFLAGS += --silent
PORT ?= 42000

.PHONY: dev validate build test deploy

default: dev

dev:
	if [ -x scripts/dev ]; then
		exec scripts/dev
	fi
	wrangler pages dev . --port $(PORT) --live-reload

validate:
	if [ -x scripts/validate ]; then
		scripts/validate
	fi

build:
	[ -x scripts/build ] && scripts/build

test:
	[ -x scripts/test ] && scripts/test

deploy:
	PROJECT_NAME=$$(cat .pages-name)
	wrangler pages deploy $$([ -d public ] && echo "public" || echo ".") --project-name=$$PROJECT_NAME
