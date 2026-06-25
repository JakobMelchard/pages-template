.ONESHELL:
MAKEFLAGS += --silent
ROOT := $(shell git rev-parse --show-toplevel 2>/dev/null || pwd)
PORT ?= 42000
PROJECT_NAME := $(shell cat $(ROOT)/.pages-name 2>/dev/null)

.PHONY: dev validate build test deploy

default: dev

dev:
	cd $(ROOT)
	[ -x scripts/dev ] && exec scripts/dev
	wrangler pages dev . --port $(PORT) --live-reload

validate:
	cd $(ROOT)
	[ -x scripts/validate ] && scripts/validate

build:
	cd $(ROOT)
	[ -x scripts/build ] && scripts/build

test:
	cd $(ROOT)
	[ -x scripts/test ] && scripts/test

deploy:
	cd $(ROOT)
	wrangler pages deploy $$([ -d public ] && echo "public" || echo ".") --project-name=$$PROJECT_NAME
